package com.kindergarten.workflow.domain;

import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "documents")
public class Document {
    @Id()
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String note;

    private String name;

    private String path;

    private DocumentStatus status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User assignee;

    @ElementCollection(fetch = FetchType.EAGER)
    @JoinColumn(name = "document_id")
    @OneToMany
    private Set<ActionLog> logs;

    private Date date;

    public Document() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNote() {

        if (StringUtils.isEmpty(note)){
            return "Неизвестно";
        }

        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getName() {
        if (StringUtils.isEmpty(name)){
            return "Неизвестно";
        }

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public DocumentStatus getStatus() {
        return status;
    }

    public String getStringStatus() {

        if (status == DocumentStatus.НаУтверждении){
            return "На согласовании";
        }else if (status == DocumentStatus.Заархивирован){
            return "В архиве";
        }else if (status == DocumentStatus.Выполнен){
            return "Исполнен";
        }else if (status == DocumentStatus.НаИсполнении){
            return "На исполнении";
        }else if (status == DocumentStatus.Зарегистрирован){
            return "Зарегистрирован";
        }
        return "Неизвестно";
    }

    public String getAssigneeName(){
        return this.assignee.getUsername();
    }


    public void setStatus(DocumentStatus status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public User getAssignee() {
        return assignee;
    }

    public void setAssignee(User assignee) {
        this.assignee = assignee;
    }

    public Set<ActionLog> getLogs() {
        return logs;
    }

    public void setLogs(Set<ActionLog> logs) {
        this.logs = logs;
    }
}