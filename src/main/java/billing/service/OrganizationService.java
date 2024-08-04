package billing.service;

import billing.dto.OrganizationDto;
import billing.pageResponse.OrganizationResponse;

public interface OrganizationService {

    OrganizationDto add(OrganizationDto organizationDto);

    OrganizationDto getOrganizationById(Long id);

    OrganizationResponse getAll(int pageNo, int pageSize, String sortBy);

    OrganizationDto updateById(OrganizationDto organizationDto, Long id);

    void deleteById(Long id);

    OrganizationResponse searchOrganization(int pageNo, int pageSize, String sortBy, String query);
}
