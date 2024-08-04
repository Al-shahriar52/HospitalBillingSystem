package billing.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String name;

    @NonNull
    @Column(unique = true)
    private String phone;

    @NonNull
    @Column(unique = true)
    private String email;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @NotNull
    private Long bmdc;

    @Enumerated(EnumType.STRING)
    private DoctorType doctorType;

    @ElementCollection
    @NotEmpty
    private List<String> specialities;

    @ElementCollection
    @NotEmpty
    private List<String> degrees = new ArrayList<>();

    @ManyToOne
    @JoinColumn
    private AppUser appUser;
}
