package billing.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DrAvailableTimes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String day;

    @NotNull
    @Temporal(TemporalType.TIME)
    @DateTimeFormat(style = "hh:mm a")
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="hh:mm a")
    private Date startTime;

    @NotNull
    @Temporal(TemporalType.TIME)
    @DateTimeFormat(style = "hh:mm a")
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="hh:mm a")
    private Date endTime;
}
