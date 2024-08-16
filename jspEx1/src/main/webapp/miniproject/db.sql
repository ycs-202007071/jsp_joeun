-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.39 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sample 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sample` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sample`;

-- 테이블 sample.books 구조 내보내기
CREATE TABLE IF NOT EXISTS `books` (
  `bookNum` varchar(50) NOT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `writer` varchar(100) DEFAULT NULL,
  `sortation` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`bookNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.books:~17 rows (대략적) 내보내기
INSERT INTO `books` (`bookNum`, `bookName`, `publisher`, `writer`, `sortation`) VALUES
	('book001', '대모험', '모험 출판사', '홍길동', 'K'),
	('book002', '만일 내가 그때 내 말을 들어줬더라면', '다산북스', '나종호', 'K'),
	('book003', '사랑과 결함', '문학동네', '예소연', 'K'),
	('book004', '지도로 보아야 보인다', '사이', '에밀리 오브리, 프랭크 테타르', 'K'),
	('book005', '이중 하나는 거짓말', '문학동네', '김애란', 'K'),
	('book006', 'A Little Life', 'Anchor Books', '한야 야나기하라', 'E'),
	('book007', 'A Good Girl\'s Guide to Murder (Paperback)  ', 'Egmont UK Ltd', '홀리 잭슨', 'E'),
	('book008', 'The Little Prince', 'Harcourt', '앙투안 드 생텍쥐페리 ', 'E'),
	('book009', 'Crying in H Mart: A Memoir ', 'Knopf', '미셸 자우너', 'E'),
	('book010', 'The Jungle Rules', 'Nature Books', 'David Johnson', 'E'),
	('book011', '당신이 누군가를 죽였다', '북다', '히가시노 게이고', 'K'),
	('book012', '저속노화 식사법', '테이스트북스', '정희원', 'K'),
	('book013', '비 그친 오후의 헌책방', '다산책방', '야기사와 사토시', 'K'),
	('book014', '불안세대', '웅진지식하우스', '조너선 하이트', 'K'),
	('book015', '침묵을 배우는 시간', '서교책방', '코프넬리아 토프', 'K'),
	('book016', ' Holes (Paperback, 미국판) ', ' Random House ', '루이스 새커', 'E'),
	('book017', 'Wonder (Paperback, 미국판, International Edition)', 'Random House USA Inc', 'R. J. Palacio', 'E'),
	('book018', 'Foster (Paperback) ', 'Faber & Faber', '클레어 키건', 'E'),
	('book019', '더 좋은 문장을 쓰고 싶은 당신을 위한 필사책', '빅피시', '이주윤', 'K');

-- 테이블 sample.loans 구조 내보내기
CREATE TABLE IF NOT EXISTS `loans` (
  `ID` varchar(50) NOT NULL,
  `bookNum` varchar(50) NOT NULL,
  `loanDate` date NOT NULL,
  PRIMARY KEY (`ID`,`bookNum`,`loanDate`),
  KEY `bookNum` (`bookNum`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`bookNum`) REFERENCES `books` (`bookNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.loans:~4 rows (대략적) 내보내기
INSERT INTO `loans` (`ID`, `bookNum`, `loanDate`) VALUES
	('user1', 'book001', '2024-08-13'),
	('user2', 'book004', '2024-08-14'),
	('user4', 'book007', '2024-08-12'),
	('user2', 'book016', '2024-08-14');

-- 테이블 sample.reviews 구조 내보내기
CREATE TABLE IF NOT EXISTS `reviews` (
  `bookNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `ID` varchar(50) NOT NULL,
  `Evaluation` varchar(10) DEFAULT NULL,
  `content` text,
  KEY `ID` (`ID`),
  KEY `booknum` (`bookNum`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.reviews:~5 rows (대략적) 내보내기
INSERT INTO `reviews` (`bookNum`, `title`, `ID`, `Evaluation`, `content`) VALUES
	('book001', '놀라운 독서', 'user1', '5', '이 책은 정말 멋진 대모험이었습니다. 시작부터 끝까지 스릴 넘치는 이야기였어요.'),
	('book002', '따뜻한 이야기', 'user3', '5', '행복한 사람들의 이야기가 따뜻하고 감동적이었습니다. 강력 추천!'),
	('book003', '매우 흥미로운', 'user2', '4', '매력적인 미스터리로 훌륭한 반전이 있었습니다. 미스터리 팬에게 추천합니다.'),
	('book005', '미래의 이야기', 'user4', '3', '시간 여행에 대한 흥미로운 아이디어였지만, 전개가 다소 느렸습니다.'),
	('book004', '자연의 소리', 'user5', '4', '정글의 법칙은 자연의 소리를 생생하게 묘사하여 흥미로웠습니다.');

-- 테이블 sample.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `ID` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `overdue` char(1) DEFAULT 'N',
  `status` varchar(10) DEFAULT 'C',
  `cnt` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.users:~8 rows (대략적) 내보내기
INSERT INTO `users` (`ID`, `pwd`, `name`, `nickname`, `phone`, `addr`, `email`, `overdue`, `status`, `cnt`) VALUES
	('admin', 'admin', '관리자', '관리자', NULL, NULL, NULL, 'N', 'A', 0),
	('user1', '1234', '김철수', 'chulsoo', '1012345678', '서울시 강남구 역삼동 123-45', 'chulsoo@example.com', 'Y', 'C', 0),
	('user2', '1234', '이영희', 'younghee', '111', '부산 중구 뭐시기 저시기', 'younghee@example.com', 'N', 'C', 0),
	('user3', '1234', '박민수', 'mins', '3012345678', '대전시 유성구 봉명동 111-22', 'mins@example.com', 'N', 'C', 0),
	('user4', '1234', '정수연', 'suyeon', '4012345678', '인천시 연수구 송도동 333-44', 'suyeon@example.com', 'Y', 'C', 0),
	('user5', '1234', '오지훈', 'jihoon', '5012345678', '광주시 동구 산수동 555-66', 'jihoon@example.com', 'N', 'C', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
