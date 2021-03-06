package fr.digicar.model;

import lombok.*;

import javax.persistence.*;
import java.lang.String;

/*
 * Created by barry on 31/12/2017.
 */

@AllArgsConstructor
@Data
@Entity
@NoArgsConstructor
@Table(name = "availability")
public class Availability {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "date")
    private String date;

    @Column(name = "id_occupation")
    private Integer idOccupation;

    /**
     * Start of time slot
     */
    @Column(name = "start_time")
    private String startTime;

    /**
     * End of time slot
     */
    @Column(name = "end_time")
    private String endTime;

    /**
     * To know if this gap is not used
     */
    @Column(name = "status")
    private Boolean status;


    public Availability(String date, int idOccupation, String startTime, String endTime, boolean status) {
        this.date = date;
        this.idOccupation = idOccupation;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setIdOccupation(Integer idOccupation) {
        this.idOccupation = idOccupation;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getId() {

        return id;
    }

    public String getDate() {
        return date;
    }

    public Integer getIdOccupation() {
        return idOccupation;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public Boolean getStatus() {
        return status;
    }
}
