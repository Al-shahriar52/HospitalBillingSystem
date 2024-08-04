package billing.service.impl;

import billing.projection.OrgAdminDashboardProjection;
import billing.repository.*;
import billing.service.OrgAdminDashboardService;
import org.springframework.stereotype.Service;

@Service
public class OrgAdminDashboardServiceImpl implements OrgAdminDashboardService {

    private final OrgDoctorRepository orgDoctorRepository;
    private final OrgMedicineRepository orgMedicineRepository;
    private final OrgDiagnosticRepository orgDiagnosticRepository;
    private final AppUserRepository appUserRepository;
    private final OrganizationRepository organizationRepository;
    private final DiagnosticBillRepository diagnosticBillRepository;
    private final PharmacyBillRepository pharmacyBillRepository;
    private final DrAppointmentRepository drAppointmentRepository;

    public OrgAdminDashboardServiceImpl(
            OrgDoctorRepository orgDoctorRepository,
            OrgMedicineRepository orgMedicineRepository,
            OrgDiagnosticRepository orgDiagnosticRepository,
            AppUserRepository appUserRepository,
            OrganizationRepository organizationRepository, DiagnosticBillRepository diagnosticBillRepository, PharmacyBillRepository pharmacyBillRepository, DrAppointmentRepository drAppointmentRepository) {
        this.orgDoctorRepository = orgDoctorRepository;
        this.orgMedicineRepository = orgMedicineRepository;
        this.orgDiagnosticRepository = orgDiagnosticRepository;
        this.appUserRepository = appUserRepository;
        this.organizationRepository = organizationRepository;
        this.diagnosticBillRepository = diagnosticBillRepository;
        this.pharmacyBillRepository = pharmacyBillRepository;
        this.drAppointmentRepository = drAppointmentRepository;
    }

    @Override
    public OrgAdminDashboardProjection stats(Long orgId) {

        Double diagnosticRevenue = (double) 0;
        Double drAppointmentRevenue= (double) 0;
        Double pharmacyRevenue= (double) 0;
        try {
            if (diagnosticBillRepository.totalRevenueOfOrg(orgId) != null)
                diagnosticRevenue = diagnosticBillRepository.totalRevenueOfOrg(orgId);
        }catch (Exception ex){
            throw ex;
        }finally {
//            diagnosticRevenue=(double)0;
        }
        try{
            if (drAppointmentRepository.totalRevenueOfOrg(orgId) != null)
                drAppointmentRevenue = drAppointmentRepository.totalRevenueOfOrg(orgId);
        }catch (Exception ex){
            throw ex;
        }finally {
//            drAppointmentRevenue=(double)0;
        }
        try{
            if (pharmacyBillRepository.totalRevenueOfOrg(orgId) != null)
                pharmacyRevenue = pharmacyBillRepository.totalRevenueOfOrg(orgId);
        }catch (Exception ex){
            throw ex;
        }finally {
//            pharmacyRevenue=(double)0;
        }

        return new OrgAdminDashboardProjection(
                orgDoctorRepository.countOrgDoctorByOrganizationId(orgId),
                orgMedicineRepository.countOrgMedicineByOrganizationId(orgId),
                orgDiagnosticRepository.countOrgDiagnosticByOrganizationId(orgId),
                appUserRepository.countAppUserByOrganizationId(orgId),
                drAppointmentRevenue
                        +diagnosticRevenue
                        +pharmacyRevenue

        );
    }
}
