package billing.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class OrgDoctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private double consultationFee;

    @NonNull
    private double followupFee;

    @NonNull
    private double reportFee;

    @NonNull
    @OneToMany(cascade = CascadeType.ALL)
    private List<DrAvailableTimes> availableDayTimes = new ArrayList<>();

    @ManyToOne()
    private Organization organization;

    @ManyToOne
    private Doctor doctor;

    @ManyToOne()
    private AppUser appUser;
}
