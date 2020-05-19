DROP SCHEMA IF EXISTS workflow;
CREATE SCHEMA workflow;

create table workflow.users
(
    id       bigint       not null
        primary key,
    active   bit          not null,
    password varchar(255) null,
    username varchar(255) null,
    initials varchar(255) null
);

INSERT INTO workflow.users (id, active, password, username, initials) VALUES (1, true, 'clerk', 'CLERK', 'Владимиров Вилли Альвианович');
INSERT INTO workflow.users (id, active, password, username, initials) VALUES (2, true, 'supervisor', 'SUPERVISOR', 'Силина Елена Прокловна');
INSERT INTO workflow.users (id, active, password, username, initials) VALUES (3, true, 'executor', 'EXECUTOR', 'Фадеева Видана Никитевна');
INSERT INTO workflow.users (id, active, password, username, initials) VALUES (4, true, 'admin', 'ADMIN', 'Жуков Иосиф Ефимович');


create table workflow.roles
(
    user_id bigint       not null,
    roles   varchar(255) null,
    constraint FK97mxvrajhkq19dmvboprimeg1
        foreign key (user_id) references workflow.users (id)
);

INSERT INTO workflow.roles (user_id, roles) VALUES (1, 'Clerk');
INSERT INTO workflow.roles (user_id, roles) VALUES (2, 'Supervisor');
INSERT INTO workflow.roles (user_id, roles) VALUES (3, 'Executor');
INSERT INTO workflow.roles (user_id, roles) VALUES (4, 'Admin');


create table workflow.documents
(
    id      int          not null
        primary key,
    date    datetime(6)  null,
    name    varchar(255) null,
    note    varchar(255) null,
    path    varchar(255) null,
    status  int          null,
    user_id bigint       null,
    constraint FKkxttj4tp5le2uth212lu49vny
        foreign key (user_id) references workflow.users (id)
);

create table workflow.action_logs
(
    id          int          not null
        primary key,
    date        datetime(6)  null,
    message     varchar(255) null,
    user_id     bigint       null,
    document_id int          null,
    constraint FK6locj4o5mo2ktklow0ywpfheg
        foreign key (user_id) references workflow.users (id),
    constraint FKcgvny52e8nhhdjguhlxtw295
        foreign key (document_id) references workflow.documents (id)
);

create table workflow.hibernate_sequence
(
    next_val bigint null
);

INSERT INTO workflow.hibernate_sequence (next_val) VALUES (33);
