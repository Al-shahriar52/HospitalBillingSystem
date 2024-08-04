package billing.service.impl;

import billing.dto.AppUserDto;
import billing.entity.AppUser;
import billing.entity.Organization;
import billing.exceptionHandling.ResourceNotFound;
import billing.pageResponse.AppUserResponse;
import billing.repository.AppUserRepository;
import billing.repository.OrganizationRepository;
import billing.service.AppUserService;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.boot.context.config.ConfigDataResourceNotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class AppUserServiceImpl implements AppUserService {
    private AppUserRepository appUserRepository;
    private OrganizationRepository organizationRepository;
    private ModelMapper mapper;

    @Override
    public AppUserDto add(Long orgId, AppUserDto appUserDto) {

        AppUser appUser = mapToEntity(appUserDto);
        Organization organization = organizationRepository.findById(orgId).orElseThrow(()->
                new ResourceNotFound("Organization","id",orgId));

        appUser.setOrganization(organization);
        AppUser newAppUser = appUserRepository.save(appUser);

        AppUserDto response = mapToDto(newAppUser);
        return response;
    }

    @Override
    public AppUserDto getAppUserById(Long id) {

        AppUser appUser = appUserRepository.findById(id).orElseThrow(()->
                new ConfigDataResourceNotFoundException(null));

        return mapToDto(appUser);
    }

    @Override
    public AppUserResponse getAllAppUser(int pageNo,
                                          int pageSize,
                                          String sortBy) {

        Pageable pageable = PageRequest.of(pageNo,pageSize, Sort.by(sortBy));
        Page<AppUser> appUsers = appUserRepository.findAll(pageable);

        List<AppUser> listOfAppUser = appUsers.getContent();
        List<AppUserDto> content = listOfAppUser.stream().map(instructor1 ->
                mapToDto(instructor1)).collect(Collectors.toList());

        AppUserResponse appUserResponse = new AppUserResponse();
        appUserResponse.setContent(content);
        appUserResponse.setPageNo(appUsers.getNumber());
        appUserResponse.setPageSize(appUsers.getSize());
        appUserResponse.setTotalElements(appUsers.getTotalElements());
        appUserResponse.setTotalPages(appUsers.getTotalPages());
        appUserResponse.setLast(appUsers.isLast());

        return appUserResponse;
    }

    @Override
    public AppUserDto updateAppUserById(AppUserDto appUserDto, Long id) {

        AppUser appUser = appUserRepository.findById(id).orElseThrow(()->
                new ConfigDataResourceNotFoundException(null));

        appUser.setEmail(appUserDto.getEmail());
        appUser.setPassword(appUserDto.getPassword());
        appUser.setRole(appUserDto.getRole());
        appUser.setName(appUserDto.getName());
        appUser.setAge(appUserDto.getAge());
        appUser.setGender(appUserDto.getGender());
        appUser.setEmail(appUserDto.getEmail());
        appUser.setPhone(appUserDto.getPhone());
        appUser.setAddress(appUserDto.getAddress());

        AppUser updateAppUser = appUserRepository.save(appUser);

        AppUserDto responseDto = mapToDto(updateAppUser);

        return responseDto;
    }

    @Override
    public AppUserResponse getAllByOrgId(int pageNo,
                                         int pageSize,
                                         String sortBy,
                                         Long orgId) {

        Pageable pageable = PageRequest.of(pageNo, pageSize , Sort.by(sortBy));
        Page<AppUser> appUsers = appUserRepository.getAllByOrganizationId(pageable, orgId);

        List<AppUser> appUserList = appUsers.getContent();
        List<AppUserDto> content = appUserList.stream().map(user-> mapToDto(user)).collect(Collectors.toList());

        AppUserResponse appUserResponse = new AppUserResponse();
        appUserResponse.setContent(content);
        appUserResponse.setPageNo(appUsers.getNumber());
        appUserResponse.setPageSize(appUsers.getSize());
        appUserResponse.setTotalElements(appUsers.getTotalElements());
        appUserResponse.setTotalPages(appUsers.getTotalPages());
        appUserResponse.setLast(appUsers.isLast());

        return appUserResponse;
    }

    @Override
    public void deleteAppUserById(Long id) {

        AppUser appUser = appUserRepository.findById(id).orElseThrow(()->
                new ConfigDataResourceNotFoundException(null));
        appUserRepository.delete(appUser);

    }

    @Override
    public AppUserResponse searchEmployee(int pageNo,
                                          int pageSize,
                                          String sortBy,
                                          String query) {

        Pageable pageable = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
        Page<AppUser> appUsers = appUserRepository.searchEmployee(pageable, query);

        List<AppUser> appUserList = appUsers.getContent();

        List<AppUserDto> content = appUserList.stream().map(user-> mapToDto(user)).collect(Collectors.toList());

        AppUserResponse appUserResponse = new AppUserResponse();
        appUserResponse.setContent(content);
        appUserResponse.setPageNo(appUsers.getNumber());
        appUserResponse.setPageSize(appUsers.getSize());
        appUserResponse.setTotalElements(appUsers.getTotalElements());
        appUserResponse.setTotalPages(appUsers.getTotalPages());
        appUserResponse.setLast(appUsers.isLast());

        return appUserResponse;
    }

    @Override
    public AppUserResponse searchOrgEmployee(int pageNo,
                                             int pageSize,
                                             String sortBy,
                                             Long orgId,
                                             String query) {

        Pageable pageable = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
        Page<AppUser> appUsers = appUserRepository.searchOrgEmployee(pageable,orgId, query);

        List<AppUser> appUserList = appUsers.getContent();

        List<AppUserDto> content = appUserList.stream().map(user-> mapToDto(user)).collect(Collectors.toList());

        AppUserResponse appUserResponse = new AppUserResponse();
        appUserResponse.setContent(content);
        appUserResponse.setPageNo(appUsers.getNumber());
        appUserResponse.setPageSize(appUsers.getSize());
        appUserResponse.setTotalElements(appUsers.getTotalElements());
        appUserResponse.setTotalPages(appUsers.getTotalPages());
        appUserResponse.setLast(appUsers.isLast());

        return appUserResponse;
    }

    public AppUser mapToEntity(AppUserDto appUserDto) {

        AppUser appUser = mapper.map(appUserDto,AppUser.class);
        return appUser;
    }

    public AppUserDto mapToDto(AppUser appUser) {

        AppUserDto appUserDto = mapper.map(appUser, AppUserDto.class);
//        appUserDto.setPassword(null);
        return appUserDto;
    }
}
