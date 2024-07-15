package com.example.spring_boot_file_upload.service;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface FileUploadService {

    public void save(MultipartFile file);

    public void deleteAll();

    public Stream<Path> getAll();

    public Resource get(String name);

}
