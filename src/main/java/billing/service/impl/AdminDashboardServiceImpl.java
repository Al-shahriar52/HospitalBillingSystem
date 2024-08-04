package billing.service.impl;

import billing.projection.AdminDashboardProjection;
import billing.repository.*;
import billing.service.AdminDashboardService;
import org.springframework.stereotype.Service;

@Service
public class AdminDashboardServiceImpl implements AdminDashboardService {

    private final DoctorRepository doctorRepository;
    private final MedicineRepository medicineRepository;
    private final DiagnosticRepository diagnosticRepository;
    private final AppUserRepository appUserRepository;
    private final OrganizationRepository organizationRepository;
    private final PatientRepository patientRepository;
    private final DiagnosticBillRepository diagnosticBillRepository;
    private final DrAppointmentRepository drAppointmentRepository;
    private final PharmacyBillRepository pharmacyBillRepository;

    public AdminDashboardServiceImpl(DoctorRepository doctorRepository,
                                     MedicineRepository medicineRepository,
                                     DiagnosticRepository diagnosticRepository,
                                     AppUserRepository appUserRepository, OrganizationRepository organizationRepository, PatientRepository patientRepository,
                                     DiagnosticBillRepository diagnosticBillRepository, DrAppointmentRepository drAppointmentRepository, PharmacyBillRepository pharmacyBillRepository) {
        this.doctorRepository = doctorRepository;
        this.medicineRepository = medicineRepository;
        this.diagnosticRepository = diagnosticRepository;
        this.appUserRepository = appUserRepository;
        this.organizationRepository = organizationRepository;
        this.patientRepository = patientRepository;
        this.diagnosticBillRepository = diagnosticBillRepository;
        this.drAppointmentRepository = drAppointmentRepository;
        this.pharmacyBillRepository = pharmacyBillRepository;
    }

    @Override
    public AdminDashboardProjection stats() {

        double diagnosticRevenue = 0;
        double drAppointmentRevenue=0;
        double pharmacyRevenue=0;
        try {
             diagnosticRevenue = diagnosticBillRepository.totalRevenue();
        }catch (Exception ex){
            throw ex;
        }finally {
//            diagnosticRevenue=0;
        }
        try{
            drAppointmentRevenue = drAppointmentRepository.totalRevenue();
        }catch (Exception ex){
        throw ex;
        }finally {
//            diagnosticRevenue=0;
        }
        try{
            pharmacyRevenue = pharmacyBillRepository.totalRevenue();
        }catch (Exception ex){
        throw ex;
        }finally {
//            pharmacyRevenue=0;
        }

        return new AdminDashboardProjection(
                doctorRepository.count(),
                medicineRepository.count(),
                diagnosticRepository.count(),
                appUserRepository.count(),
                organizationRepository.count(),
                patientRepository.count(),
                diagnosticRevenue+
                        +drAppointmentRevenue
                        +pharmacyRevenue

        );
    }
}
