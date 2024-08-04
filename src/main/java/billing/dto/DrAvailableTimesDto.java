package billing.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
public class DrAvailableTimesDto {

    private Long id;

    @NotNull
    private String day;

    private Date startTime;

    private Date endTime;
}
