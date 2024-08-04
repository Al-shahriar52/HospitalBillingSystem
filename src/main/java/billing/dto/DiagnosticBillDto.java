package billing.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class DiagnosticBillDto {

    private Long id;

    @NotNull(message = "Diagnostic service list and discount shouldn't be blank.")
    private List<OrgDiagnosticAndDiscountWrapperDto> orgDiagnosticAndDiscounts;

    @NotNull(message = "Diagnostic service totalFeeWithoutDiscount shouldn't be blank.")
    private double totalFeeWithoutAnyDiscount;

    @NotNull(message = "Diagnostic service totalFeeWithoutDiscount shouldn't be blank.")
    private double totalFeeAfterIndividualDiscount;

    @NotNull(message = "Diagnostic service overallDiscount shouldn't be blank.")
    private byte overallDiscount;

    @NotNull(message = "Diagnostic service finalFee shouldn't be blank.")
    private double finalFeeAfterAllDiscount;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Date timestamp = new Date();

    @Min(1)
    @NotNull(message = "Patient ID shouldn't be blank.")
    private Long patientId;


}
