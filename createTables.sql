drop database if exists db_invent;
create database db_invent;
use db_invent;

-- Crear tabla category
CREATE TABLE category (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    name VARCHAR(100),
    description TEXT,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),       -- Usando BIT(1) para estado (BOOLEAN)
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla person
CREATE TABLE person (
    id BIGINT PRIMARY KEY,
    address VARCHAR(255),
    document_num VARCHAR(15),
    document_type VARCHAR(20),
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_name VARCHAR(50),
    phone VARCHAR(15),
    second_last_name VARCHAR(50),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla payment_method
CREATE TABLE payment_method (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    name VARCHAR(100),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla company
CREATE TABLE company (
    id BIGINT PRIMARY KEY,
    address VARCHAR(255),
    email VARCHAR(100),
    name VARCHAR(100),
    phone VARCHAR(15),
    manager_id BIGINT,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla branch
CREATE TABLE branch (
    id BIGINT PRIMARY KEY,
    address VARCHAR(255),
    email VARCHAR(100),
    name VARCHAR(100),
    phone VARCHAR(15),
    company_id BIGINT,
    responsible_id BIGINT,
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (responsible_id) REFERENCES person(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla product
CREATE TABLE product (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    category_id BIGINT,
    FOREIGN KEY (category_id) REFERENCES category(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla inventory
CREATE TABLE inventory (
    id BIGINT PRIMARY KEY,
    date DATE,
    purchase_value DOUBLE,
    sale_value DOUBLE,
    stock INT,
    branch_id BIGINT,
    product_id BIGINT,
    FOREIGN KEY (branch_id) REFERENCES branch(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla invoice
CREATE TABLE invoice (
    id BIGINT PRIMARY KEY,
    date DATE,
    discount_value DOUBLE,
    gross_value DOUBLE,
    net_value DOUBLE,
    paym_method_id BIGINT,
    client_id BIGINT,
    FOREIGN KEY (paym_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (client_id) REFERENCES person(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla invoice_detail
CREATE TABLE invoice_detail (
    id BIGINT PRIMARY KEY,
    discount_percentage DOUBLE,
    gross_value DOUBLE,
    net_value DOUBLE,
    quantity INT,
    product_id BIGINT,
    invoice_id BIGINT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla user
CREATE TABLE user (
    id BIGINT PRIMARY KEY,
    password VARCHAR(255),
    username VARCHAR(50),
    person_id BIGINT,
    FOREIGN KEY (person_id) REFERENCES person(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla role
CREATE TABLE role (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla user_role
CREATE TABLE user_role (
    id BIGINT PRIMARY KEY,
    role_id BIGINT,
    user_id BIGINT,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla view
CREATE TABLE view (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    path VARCHAR(255),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla module
CREATE TABLE module (
    id BIGINT PRIMARY KEY,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    path VARCHAR(255),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla module_view
CREATE TABLE module_view (
    id BIGINT PRIMARY KEY,
    module_id BIGINT,
    view_id BIGINT,
    FOREIGN KEY (module_id) REFERENCES module(id),
    FOREIGN KEY (view_id) REFERENCES view(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);

-- Crear tabla role_module
CREATE TABLE role_module (
    id BIGINT PRIMARY KEY,
    role_id BIGINT,
    module_id BIGINT,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (module_id) REFERENCES module(id),
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT
);
