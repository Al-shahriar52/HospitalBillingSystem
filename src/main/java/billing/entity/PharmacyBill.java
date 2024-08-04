package billing.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PharmacyBill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ElementCollection
    private List<Integer> medQuantities = new ArrayList<>();

    @NotNull
    private double totalBill;

    @NotNull
    private double discount;

    @NotNull
    private double finalBill;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(shape=JsonFormat.Shape.STRING)
    private Date createdAt = new Date();

    @NotNull
    @ManyToMany
    @ToString.Exclude
    private List<Medicine> medicines = new ArrayList<>();

    @NotNull
    @ManyToOne
    private Patient patient;

    @NotNull
    @ManyToOne
    private Organization organization;

    @ManyToOne
    private AppUser createdBy;
}
