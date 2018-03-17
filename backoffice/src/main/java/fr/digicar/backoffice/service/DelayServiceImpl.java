package fr.digicar.backoffice.service;

import fr.digicar.backoffice.utils.DelayDistribution;
import fr.digicar.dao.DelayDAO;
import fr.digicar.model.Delay;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
@Transactional
public class DelayServiceImpl implements DelayService {

    @Autowired
    private DelayDAO delayDAO;

    @Override
    public DelayDistribution getDelayDistribution() {
        Date today = new Date();
        int[] values = getDelayValues(delayDAO.filterByDate(getPreviousYearDate(today), today));

        int[] distribution = new int[4];

        int firstQuartile = getQuartile(values, 25);
        int secondQuartile = getQuartile(values, 50);
        int thirdQuartile = getQuartile(values, 75);

        for (int i = 0; i < 4; i++) {
            int count = 0;
            for (int value : values) {
                switch (i) {
                    case 0:
                        if (value >= values[0] && value < firstQuartile) count++;
                        break;
                    case 1:
                        if (value >= firstQuartile && value < secondQuartile) count++;
                        break;
                    case 2:
                        if (value >= secondQuartile && value < thirdQuartile) count++;
                        break;
                    case 3:
                        if (value >= thirdQuartile && value <= values[values.length - 1]) count++;
                        break;
                }
            }
            distribution[i] = count;
        }
        return new DelayDistribution(distribution, getQuartileLabels(new int[]{values[0], firstQuartile, secondQuartile, thirdQuartile, values[values.length - 1]}));
    }

    @Override
    public int getDelayNumber() {
        Date today = new Date();
        return delayDAO.countByDate(getPreviousYearDate(today), today);
    }

    private String[] getQuartileLabels(int[] quartiles) {
        String[] labels = new String[4];
        labels[0] = String.valueOf(quartiles[0]) + "-" + String.valueOf(quartiles[1]);
        labels[1] = String.valueOf(quartiles[1] + 1) + "-" + String.valueOf(quartiles[2]);
        labels[2] = String.valueOf(quartiles[2] + 1) + "-" + String.valueOf(quartiles[3]);
        labels[3] = String.valueOf(quartiles[3] + 1) + "-" + String.valueOf(quartiles[4]);
        return labels;
    }

    private int getQuartile(int[] values, int lowerPercent) {
        int n = Math.round(values.length * lowerPercent / 100);
        return values[n];
    }

    private int[] getDelayValues(List<Delay> delays) {
        int[] values = new int[delays.size()];
        for (int i = 0; i < values.length; i++) {
            values[i] = delays.get(i).getDuration();
        }
        Arrays.sort(values);
        return values;
    }

    private Date getPreviousYearDate(Date date) {
        Calendar previousYearDate = Calendar.getInstance();
        previousYearDate.setTime(date);
        previousYearDate.add(Calendar.YEAR, -1);
        return previousYearDate.getTime();
    }

}
