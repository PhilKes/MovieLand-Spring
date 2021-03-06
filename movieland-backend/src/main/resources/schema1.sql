DROP TABLE IF EXISTS RESERVATION;
DROP TABLE IF EXISTS USER_ROLES;
DROP TABLE IF EXISTS ROLE;
DROP TABLE IF EXISTS MOVIE_SHOW;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS MOVIE;

CREATE TABLE IF NOT EXISTS MOVIE(
  MOVIE_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
  NAME VARCHAR(255) NOT NULL,
  RELEASE_DATE DATE,
  DESCRIPTION MEDIUMTEXT,
  POSTER_URL MEDIUMTEXT,
  TMDB_ID BIGINT
);

CREATE TABLE IF NOT EXISTS USER(
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  email VARCHAR(40),
  name VARCHAR(40) NOT NULL,
  username VARCHAR(15) NOT NULL,
  password VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS MOVIE_SHOW(
  SHOW_ID BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  MOVIE_ID BIGINT(20) NOT NULL,
  RELEASE_DATE DATETIME NOT NULL,
  CONSTRAINT fk_movie FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS RESERVATION(
  reservation_id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  show_id BIGINT(20) NOT NULL,
  user_id BIGINT(20) NOT NULL,
  CONSTRAINT fk_show FOREIGN KEY (show_id) REFERENCES MOVIE_SHOW(show_id) ON DELETE CASCADE,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES USER(id) ON DELETE CASCADE

);


CREATE TABLE IF NOT EXISTS ROLE
(
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name ENUM ('USER','ADMIN')
);

CREATE TABLE IF NOT EXISTS USER_ROLES
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES USER (id) ON DELETE CASCADE,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES ROLE (id) ON DELETE CASCADE
);
