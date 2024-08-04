package billing.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DiagnosticBill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<OrgDiagnosticAndDiscount> orgDiagnosticAndDiscounts;

    private double totalFeeWithoutAnyDiscount;

    private double totalFeeAfterIndividualDiscount;

    private byte overallDiscount;

    private double finalFeeAfterAllDiscount;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Date timestamp = new Date();

    @ManyToOne
    private AppUser appUser;

    @ManyToOne
    @JoinColumn(name = "organization_id")
    private Organization organization;

    @ManyToOne
    private Patient patient;
}
