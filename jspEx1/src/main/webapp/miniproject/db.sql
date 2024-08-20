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
	('user11', 'book001', '2024-08-20'),
	('user4', 'book007', '2024-08-12'),
	('user11', 'book011', '2024-08-20'),
	('user12', 'book015', '2024-08-20'),
	('user2', 'book016', '2024-08-14');

-- 테이블 sample.reviews 구조 내보내기
CREATE TABLE IF NOT EXISTS `reviews` (
  `reviewNo` int NOT NULL AUTO_INCREMENT,
  `bookNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `ID` varchar(50) NOT NULL,
  `Evaluation` varchar(10) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`reviewNo`),
  KEY `ID` (`ID`),
  KEY `booknum` (`bookNum`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.reviews:~5 rows (대략적) 내보내기
INSERT INTO `reviews` (`reviewNo`, `bookNum`, `title`, `ID`, `Evaluation`, `content`) VALUES
	(8, 'book001', '놀라운 독서', 'user1', '5', '이 책은 정말 멋진 대모험이었습니다. 시작부터 끝까지 스릴 넘치는 이야기였어요.'),
	(9, 'book002', '따뜻한 이야기', 'user3', '5', '행복한 사람들의 이야기가 따뜻하고 감동적이었습니다. 강력 추천!'),
	(10, 'book003', '매우 흥미로운', 'user2', '4', '매력적인 미스터리로 훌륭한 반전이 있었습니다. 미스터리 팬에게 추천합니다.'),
	(11, 'book005', '미래의 이야기', 'user4', '3', '시간 여행에 대한 흥미로운 아이디어였지만, 전개가 다소 느렸습니다.'),
	(12, 'book004', '자연의 소리', 'user5', '4', '정글의 법칙은 자연의 소리를 생생하게 묘사하여 흥미로웠습니다.'),
	(15, 'book001', '훌륭한 대모험', 'user6', '5', '모험의 연대기가 정말 흥미로웠습니다. 추천합니다!'),
	(16, 'book002', '감동적인 이야기', 'user7', '4', '따뜻한 이야기로 감동을 받았습니다. 하지만 좀 더 긴 이야기가 좋았을 것 같아요.'),
	(17, 'book003', '재미있지만', 'user8', '3', '흥미로운 내용이지만, 결말이 다소 예측 가능했습니다.'),
	(18, 'book004', '매력적인 내용', 'user9', '5', '자연과 모험의 조화가 매력적이었습니다. 모든 페이지가 흥미로웠어요.'),
	(19, 'book005', '상상력을 자극하는', 'user10', '4', '흥미로운 상상력으로 가득한 이야기였습니다. 다만 약간 지루함이 있었습니다.'),
	(20, 'book006', '강렬한 드라마', 'user11', '5', '이 책의 감정 표현이 너무 강렬했습니다. 감동적이고 매력적인 이야기입니다.'),
	(21, 'book007', '흥미진진한 미스터리', 'user12', '4', '미스터리의 전개가 흥미로웠습니다. 다만 몇 군데는 예측 가능했어요.'),
	(22, 'book008', '고전의 매력', 'user13', '5', '어린 시절 읽었던 기억이 나네요. 고전의 매력이 여전히 느껴집니다.'),
	(23, 'book009', '깊이 있는 자서전', 'user14', '5', '자신의 경험을 진솔하게 담아낸 책입니다. 매우 감동적이었습니다.'),
	(25, 'book011', '도전과 성장', 'user6', '5', '도전과 성장의 이야기로 감동적이었습니다. 매우 추천합니다!'),
	(26, 'book012', '실용적인 지침서', 'user7', '4', '실용적인 내용이 가득했지만, 좀 더 구체적인 예시가 필요했어요.'),
	(27, 'book013', '헐리웃 스타일', 'user8', '3', '헐리웃 스타일의 이야기가 흥미로웠지만, 전개가 다소 평이했습니다.'),
	(28, 'book014', '새로운 시각', 'user9', '5', '새로운 시각으로 바라본 사회적 이슈가 흥미로웠습니다. 인상 깊은 책이었습니다.'),
	(29, 'book015', '심도 있는 분석', 'user10', '4', '심도 있는 분석이 좋았지만, 일부는 지나치게 복잡했습니다.'),
	(30, 'book016', '흥미로운 이야기', 'user11', '5', '이야기의 전개가 매력적이었습니다. 책을 덮는 순간까지 집중하게 만들었어요.'),
	(31, 'book017', '재미있는 내용', 'user12', '4', '내용이 재미있고 흥미로웠지만, 약간의 전개가 지루했습니다.'),
	(32, 'book018', '감동적인 이야기', 'user13', '5', '감동적이고 진솔한 내용이 좋았습니다. 강력 추천합니다.'),
	(33, 'book019', '비극적이지만 아름다운', 'user14', '4', '비극적인 내용이지만 아름답게 그려진 이야기가 좋았습니다.'),
	(35, 'book001', '모험의 끝', 'user6', '4', '모험의 끝을 보는 것이 흥미로웠습니다. 하지만 약간의 예상 가능한 부분도 있었어요.'),
	(36, 'book002', '따뜻한 감동', 'user7', '5', '따뜻한 이야기로 감동적이었습니다. 또 읽고 싶어요.'),
	(37, 'book003', '매력적인 미스터리', 'user8', '4', '미스터리의 매력적인 요소가 좋았지만, 약간의 느슨한 부분이 아쉬웠습니다.'),
	(38, 'book004', '자연과의 교감', 'user9', '5', '자연과의 교감이 잘 드러난 이야기였습니다. 매우 좋았습니다.'),
	(39, 'book005', '상상력의 한계', 'user10', '3', '상상력은 좋았으나 일부 전개가 느려서 다소 지루했습니다.'),
	(40, 'book006', '깊은 감동', 'user11', '5', '깊은 감동을 준 책입니다. 감정의 표현이 매우 좋았어요.'),
	(41, 'book007', '미스터리의 매력', 'user12', '4', '미스터리의 전개가 흥미롭지만, 몇 군데는 예측 가능했습니다.'),
	(42, 'book008', '고전의 재발견', 'user13', '5', '고전의 매력을 새롭게 재발견한 느낌이었습니다. 강력 추천합니다.'),
	(43, 'book009', '진솔한 자서전', 'user14', '5', '진솔하게 자신의 경험을 담아낸 자서전으로 감동적이었습니다.'),
	(45, 'book011', '도전적인 이야기', 'user6', '5', '도전과 성장의 이야기가 너무 좋았습니다. 강력히 추천합니다.'),
	(46, 'book012', '유용한 정보', 'user7', '4', '유용한 정보가 많았지만, 조금 더 실용적인 부분이 필요했습니다.'),
	(47, 'book013', '헐리웃 감성', 'user8', '3', '헐리웃 감성으로 흥미로웠지만, 다소 평이한 부분이 있었습니다.'),
	(48, 'book014', '사회적 이슈', 'user9', '5', '사회적 이슈를 새로운 시각으로 바라본 것이 좋았습니다. 인상적이었습니다.'),
	(49, 'book015', '복잡한 전개', 'user10', '4', '복잡한 전개가 있지만, 그 속에서 흥미로운 내용이 있었습니다.'),
	(50, 'book016', '매력적인 전개', 'user11', '5', '매력적인 이야기 전개로 몰입감이 컸습니다. 매우 좋았어요.'),
	(51, 'book017', '재미있었으나', 'user12', '4', '재미있는 부분이 많았지만, 일부는 지루했습니다.'),
	(52, 'book018', '감동의 연속', 'user13', '5', '감동적이고 진솔한 이야기였습니다. 다시 읽고 싶어요.'),
	(53, 'book019', '아름다운 비극', 'user14', '4', '아름다운 비극적 이야기로 인상 깊었습니다. 좀 더 깊이 있었으면 좋겠어요.'),
	(55, 'book001', '대모험의 완성', 'user6', '5', '대모험의 완성도 높은 이야기였습니다. 매우 추천합니다!'),
	(56, 'book002', '따뜻한 감동이 가득', 'user7', '4', '따뜻한 감동이 가득한 이야기였습니다. 더 길었으면 좋겠어요.'),
	(57, 'book003', '매력적인 이야기', 'user8', '4', '매력적인 이야기와 훌륭한 반전이 좋았습니다. 다만 다소 예측 가능한 부분도 있었어요.'),
	(58, 'book004', '자연의 매력', 'user9', '5', '자연의 매력을 잘 담아낸 이야기였습니다. 매우 좋았습니다.'),
	(59, 'book005', '상상력이 뛰어난', 'user10', '4', '상상력과 흥미로운 전개가 좋았으나, 약간 지루할 때도 있었습니다.'),
	(60, 'book006', '강렬한 감동', 'user11', '5', '강렬한 감동을 주는 이야기였습니다. 다시 읽고 싶어요.'),
	(61, 'book007', '흥미로운 미스터리', 'user12', '4', '흥미로운 미스터리로 몰입할 수 있었습니다. 몇 군데는 예측 가능했습니다.'),
	(62, 'book008', '클래식의 매력', 'user13', '5', '클래식의 매력이 여전히 빛나는 책입니다. 강력 추천합니다.'),
	(63, 'book009', '진솔한 자서전', 'user14', '5', '진솔한 자서전으로 감동적이었습니다. 매우 좋았어요.'),
	(65, 'book011', '도전과 성장', 'user6', '5', '도전과 성장의 이야기가 감동적이었습니다. 강력 추천합니다!'),
	(66, 'book012', '실용적인 조언', 'user7', '4', '실용적인 조언이 많았지만, 구체적인 예시가 더 필요했습니다.'),
	(67, 'book013', '헐리웃 스타일', 'user8', '3', '헐리웃 스타일의 이야기가 좋았지만, 평이한 전개가 아쉬웠습니다.'),
	(68, 'book014', '새로운 시각', 'user9', '5', '사회적 이슈를 새로운 시각으로 바라본 것이 인상적이었습니다. 추천합니다.'),
	(69, 'book015', '복잡하지만 흥미로운', 'user10', '4', '복잡한 전개가 흥미로웠습니다. 더 많은 세부사항이 좋았을 것 같아요.'),
	(70, 'book016', '매력적인 이야기', 'user11', '5', '매력적인 전개와 감동적인 내용이 좋았습니다. 다시 읽고 싶어요.'),
	(71, 'book017', '재미있는 이야기', 'user12', '4', '재미있고 흥미로운 이야기였으나, 일부는 다소 지루했습니다.'),
	(72, 'book018', '감동적인 서사', 'user13', '5', '감동적이고 진솔한 서사로 좋은 책이었습니다. 추천합니다.'),
	(73, 'book019', '아름다운 비극', 'user14', '4', '아름다운 비극적 이야기로 인상 깊었습니다. 좀 더 깊이 있었으면 좋겠어요.'),
	(75, 'book006', '진지한 이야기', 'user6', '5', '이 책은 감동적이고 진지한 이야기로 마음을 깊게 울렸습니다. 추천합니다.'),
	(76, 'book007', '미스터리의 재미', 'user7', '4', '미스터리의 재미와 긴장감이 좋았지만, 끝부분은 좀 더 흥미진진했으면 좋았을 것 같아요.'),
	(77, 'book008', '동화의 매력', 'user8', '5', '어린 시절 읽었던 동화가 여전히 감동적입니다. 고전의 매력을 다시 느꼈습니다.'),
	(78, 'book009', '자서전의 진실', 'user9', '5', '진솔한 자서전으로 깊이 있는 이야기가 좋았습니다. 정말 감동적이었어요.'),
	(79, 'book010', '자연의 경이로움', 'user10', '4', '자연을 잘 묘사한 이야기였습니다. 다만, 더 많은 세부적인 묘사가 있었으면 좋았을 것 같습니다.'),
	(80, 'book011', '진정한 성장', 'user11', '5', '도전과 성장의 이야기가 감동적이었습니다. 여러 번 읽어도 좋을 책입니다.'),
	(81, 'book012', '유용한 가이드', 'user12', '4', '실용적인 조언이 많았지만, 좀 더 실전 예시가 필요했어요. 유용한 내용이었습니다.'),
	(82, 'book013', '헐리웃 감성', 'user13', '3', '헐리웃 스타일의 이야기로 흥미로웠지만, 결말이 예상 가능했습니다.'),
	(83, 'book014', '사회적 시각', 'user14', '5', '사회적 이슈를 새로운 시각으로 바라본 내용이 좋았습니다. 매우 인상 깊었습니다.'),
	(85, 'book016', '매력적인 스토리', 'user6', '5', '이야기의 전개가 매력적이었습니다. 책을 덮는 순간까지 몰입했습니다.'),
	(86, 'book017', '재미있는 내용', 'user7', '4', '재미있고 흥미로운 내용이었지만, 일부는 다소 지루했습니다.'),
	(87, 'book018', '감동적인 서사', 'user8', '5', '감동적이고 진솔한 서사로 좋았습니다. 다시 읽고 싶어요.'),
	(88, 'book019', '아름다운 비극', 'user9', '4', '아름다운 비극적 이야기로 인상 깊었습니다. 깊이가 더 있었으면 좋겠어요.'),
	(89, 'book020', '흥미로운 전개', 'user10', '3', '흥미로운 부분도 있었지만, 전개가 다소 느려서 지루했습니다.'),
	(90, 'book011', '도전과 희망', 'user11', '5', '도전과 희망의 이야기가 감동적이었습니다. 추천합니다!'),
	(91, 'book012', '실용적인 조언', 'user12', '4', '실용적인 조언이 많았지만, 좀 더 구체적인 예시가 필요했습니다.'),
	(92, 'book013', '헐리웃 스타일', 'user13', '3', '헐리웃 감성의 이야기였으나, 전개가 다소 평이했습니다.'),
	(93, 'book014', '새로운 시각', 'user14', '5', '사회적 이슈를 새로운 시각으로 바라본 것이 좋았습니다. 매우 인상 깊었습니다.'),
	(95, 'book016', '매력적인 전개', 'user6', '5', '매력적인 이야기 전개로 몰입감이 컸습니다. 매우 좋았어요.'),
	(96, 'book017', '재미있지만', 'user7', '4', '재미있지만, 일부는 다소 지루했습니다. 전반적으로 좋았어요.'),
	(97, 'book018', '감동적인 이야기', 'user8', '5', '감동적이고 진솔한 이야기였습니다. 다시 읽고 싶어요.'),
	(98, 'book019', '아름다운 비극', 'user9', '4', '아름다운 비극적 이야기로 인상 깊었습니다. 좀 더 깊이 있었으면 좋겠어요.'),
	(99, 'book020', '흥미로운 내용', 'user10', '3', '흥미로운 내용이었지만, 전개가 느려서 지루했습니다.'),
	(100, 'book001', '대모험의 여정', 'user11', '5', '대모험의 여정을 통해 많은 감동을 받았습니다. 추천합니다!'),
	(101, 'book002', '감동적인 이야기', 'user12', '4', '감동적인 이야기였으나, 좀 더 긴 내용이었으면 좋겠어요.'),
	(102, 'book003', '매력적인 미스터리', 'user13', '4', '미스터리의 매력적인 요소가 좋았지만, 약간의 느슨함이 있었습니다.'),
	(103, 'book004', '자연의 아름다움', 'user14', '5', '자연의 아름다움을 잘 표현한 이야기였습니다. 매우 좋았습니다.'),
	(105, 'book006', '강렬한 감동', 'user6', '5', '강렬한 감동을 주는 이야기였습니다. 다시 읽고 싶어요.'),
	(106, 'book007', '흥미로운 미스터리', 'user7', '4', '미스터리의 전개가 흥미로웠습니다. 몇 군데는 예측 가능했습니다.'),
	(107, 'book008', '고전의 매력', 'user8', '5', '고전의 매력이 여전히 빛나는 책입니다. 강력 추천합니다.'),
	(108, 'book009', '진솔한 자서전', 'user9', '5', '진솔하게 자신의 경험을 담아낸 자서전으로 감동적이었습니다.'),
	(109, 'book010', '자연의 미학', 'user10', '4', '자연의 미학을 잘 표현한 책이었습니다. 더 많은 디테일이 있었으면 좋겠어요.'),
	(110, 'book011', '도전과 성장', 'user11', '5', '도전과 성장의 이야기가 감동적이었습니다. 강력히 추천합니다.'),
	(111, 'book012', '유용한 정보', 'user12', '4', '유용한 정보가 많았지만, 좀 더 실전 예시가 필요했습니다.'),
	(112, 'book013', '헐리웃 감성', 'user13', '3', '헐리웃 감성의 이야기가 좋았지만, 다소 평이한 부분이 있었습니다.'),
	(113, 'book014', '사회적 이슈', 'user14', '5', '사회적 이슈를 새로운 시각으로 바라본 것이 인상적이었습니다. 추천합니다.'),
	(115, 'book016', '매력적인 스토리', 'user6', '5', '매력적인 스토리와 깊이 있는 내용이 좋았습니다. 다시 읽고 싶어요.'),
	(116, 'book017', '재미있지만', 'user7', '4', '재미있지만, 일부는 다소 지루했습니다. 전반적으로 흥미로웠어요.'),
	(117, 'book018', '감동적인 서사', 'user8', '5', '감동적이고 진솔한 서사로 좋았습니다. 강력 추천합니다.'),
	(118, 'book019', '아름다운 비극', 'user9', '4', '아름다운 비극적 이야기로 인상 깊었습니다. 좀 더 깊이 있었으면 좋겠어요.'),
	(119, 'book020', '흥미로운 이야기', 'user10', '3', '흥미로운 이야기였지만, 전개가 다소 느려서 지루했습니다.'),
	(120, 'book011', '도전과 희망', 'user11', '5', '도전과 희망의 이야기가 감동적이었습니다. 매우 좋았습니다!'),
	(121, 'book012', '실용적인 조언', 'user12', '4', '실용적인 조언이 많았지만, 좀 더 구체적인 예시가 필요했습니다.'),
	(122, 'book013', '헐리웃 스타일', 'user13', '3', '헐리웃 감성의 이야기였으나, 전개가 다소 평이했습니다.'),
	(123, 'book014', '새로운 시각', 'user14', '5', '사회적 이슈를 새로운 시각으로 바라본 것이 좋았습니다. 매우 인상 깊었습니다.'),
	(125, 'book016', '매력적인 전개', 'user6', '5', '매력적인 이야기 전개와 깊이 있는 내용이 좋았습니다. 추천합니다.'),
	(126, 'book017', '재미있는 이야기', 'user7', '4', '재미있고 흥미로운 이야기였으나, 일부는 지루했습니다.'),
	(128, 'book019', '아름다운 비극', 'user9', '4', '아름다운 비극적 이야기로 인상 깊었습니다. 깊이가 더 있었으면 좋겠어요.'),
	(129, 'book020', '흥미로운 내용', 'user10', '3', '흥미로운 내용이었지만, 전개가 느려서 다소 지루했습니다.');

-- 테이블 sample.tbl_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `boardNo` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` text,
  `cnt` int DEFAULT '0',
  `userId` varchar(50) NOT NULL,
  `kind` enum('number') NOT NULL,
  `cdatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `udatetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`boardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.tbl_board:~9 rows (대략적) 내보내기
INSERT INTO `tbl_board` (`boardNo`, `title`, `contents`, `cnt`, `userId`, `kind`, `cdatetime`, `udatetime`) VALUES
	(6, '여섯 번째 게시글', '이것은 여섯 번째 게시글의 내용입니다.', 15, 'user3', 'number', '2024-08-06 10:28:56', '2024-08-06 13:08:49'),
	(7, '일곱 번째 게시글', '이것은 일곱 번째 게시글의 내용입니다.', 7, 'user2', 'number', '2024-08-06 10:28:56', '2024-08-06 13:08:51'),
	(9, '아홉 번째 게시글', '이것은 아홉 번째 게시글의 내용입니다.', 11, 'user2', 'number', '2024-08-06 10:28:56', '2024-08-06 13:08:55'),
	(10, '열 번째 게시글', '이것은 열 번째 게시글의 내용입니다.', 2, 'user3', 'number', '2024-08-06 10:28:56', '2024-08-06 13:08:57'),
	(11, 'test', '1234', 0, 'user1', 'number', '2024-08-06 12:31:15', '2024-08-06 12:31:15'),
	(16, 'test', '1234', 0, 'user3', 'number', '2024-08-07 09:41:12', '2024-08-07 09:41:12'),
	(17, 'ddd', 'null', 0, 'user1', 'number', '2024-08-09 17:37:16', '2024-08-09 17:37:16'),
	(18, 'ddd', 'null', 0, 'user1', 'number', '2024-08-09 17:39:00', '2024-08-09 17:39:00'),
	(19, 'ddd', 'null', 0, 'user1', 'number', '2024-08-09 17:39:30', '2024-08-09 17:39:30');

-- 테이블 sample.tbl_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `commentNo` int NOT NULL AUTO_INCREMENT,
  `boardNo` int NOT NULL,
  `userId` varchar(50) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `pCommentNo` int DEFAULT NULL,
  `cdatetime` datetime NOT NULL,
  `udatetime` datetime NOT NULL,
  PRIMARY KEY (`commentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.tbl_comment:~11 rows (대략적) 내보내기
INSERT INTO `tbl_comment` (`commentNo`, `boardNo`, `userId`, `comment`, `pCommentNo`, `cdatetime`, `udatetime`) VALUES
	(1, 5, 'null', 'null', 0, '2024-08-07 17:46:37', '2024-08-07 17:46:37'),
	(2, 5, 'null', 'null', 0, '2024-08-07 17:47:16', '2024-08-07 17:47:16'),
	(3, 5, 'null', 'null', 0, '2024-08-07 17:47:37', '2024-08-07 17:47:37'),
	(4, 5, 'null', 'null', 0, '2024-08-07 17:49:55', '2024-08-07 17:49:55'),
	(5, 5, 'null', 'ddddd', 0, '2024-08-07 17:50:02', '2024-08-07 17:50:02'),
	(6, 5, '', 'ddddd', 0, '2024-08-07 17:51:49', '2024-08-07 17:51:49'),
	(7, 5, 'user1', 'ㅇㅅㅇ', 0, '2024-08-07 17:52:32', '2024-08-07 17:52:32'),
	(8, 5, 'user1', 'ddd', 0, '2024-08-08 15:53:06', '2024-08-08 15:53:06'),
	(9, 5, 'user1', 'ddd', 0, '2024-08-08 15:53:08', '2024-08-08 15:53:08'),
	(10, 5, 'user1', 'zzzzzz', 0, '2024-08-08 15:53:12', '2024-08-08 15:53:12'),
	(11, 5, 'user1', 'zzzzzz', 0, '2024-08-08 15:53:13', '2024-08-08 15:53:13');

-- 테이블 sample.tbl_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `userId` varchar(50) NOT NULL,
  `pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cnt` int DEFAULT '0',
  `banYn` varchar(50) DEFAULT 'N',
  `status` varchar(50) DEFAULT 'C',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sample.tbl_user:~4 rows (대략적) 내보내기
INSERT INTO `tbl_user` (`userId`, `pwd`, `name`, `cnt`, `banYn`, `status`) VALUES
	('admin', 'admin', '관리자', 0, 'N', 'A'),
	('test', '', '', 0, 'N', 'C'),
	('user1', '1234', '홍길동', 0, 'N', 'C'),
	('user2', '1234', '김철수', 0, 'N', 'C'),
	('user3', '1234', '박영희', 0, 'N', 'C');

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

-- 테이블 데이터 sample.users:~6 rows (대략적) 내보내기
INSERT INTO `users` (`ID`, `pwd`, `name`, `nickname`, `phone`, `addr`, `email`, `overdue`, `status`, `cnt`) VALUES
	('admin', 'admin', '관리자', '관리자', NULL, NULL, NULL, 'N', 'A', 0),
	('user1', '1234', '김철수', 'chulsoo', '1012345678', '서울시 강남구 역삼동 123-45', 'chulsoo@example.com', 'Y', 'C', 0),
	('user10', '1234', '정유진', 'yujin', '0112345678', '부산시 해운대구 우동 456-78', 'yujin@example.com', 'Y', 'C', 2),
	('user11', '1234', '한재현', 'jaehyun', '0212345678', '경기도 수원시 권선구 세류동 567-89', 'jaehyun@example.com', 'N', 'C', 0),
	('user12', '1234', '오세훈', 'sehoon', '0312345678', '대구광역시 중구 대봉동 678-90', 'sehoon@example.com', 'N', 'C', 0),
	('user13', '1234', '이정호', 'jeongho', '0412345678', '서울시 강서구 화곡동 789-01', 'jeongho@example.com', 'Y', 'C', 0),
	('user14', '1234', '정다영', 'dayoung', '0512345678', '광주광역시 서구 화정동 890-12', 'dayoung@example.com', 'N', 'C', 0),
	('user2', '1234', '이영희', 'younghee', '111', '부산 중구 뭐시기 저시기', 'younghee@example.com', 'N', 'C', 0),
	('user3', '1234', '박민수', 'mins', '3012345678', '대전시 유성구 봉명동 111-22', 'mins@example.com', 'N', 'C', 0),
	('user4', '1234', '정수연', 'suyeon', '4012345678', '인천시 연수구 송도동 333-44', 'suyeon@example.com', 'N', 'C', 0),
	('user5', '1234', '오지훈', 'jihoon', '5012345678', '광주시 동구 산수동 555-66', 'jihoon@example.com', 'N', 'C', 0),
	('user6', '1234', '이민호', 'minho', '6012345678', '울산광역시 남구 삼산동 777-88', 'minho@example.com', 'N', 'C', 0),
	('user7', '1234', '최지혜', 'jihye', '7012345678', '경기도 성남시 분당구 정자동 123-45', 'jihye@example.com', 'Y', 'C', 1),
	('user8', '1234', '한승훈', 'seunghoon', '8012345678', '서울시 마포구 상암동 234-56', 'seunghoon@example.com', 'N', 'C', 0),
	('user9', '1234', '김미래', 'mirae', '9012345678', '서울시 송파구 잠실동 345-67', 'mirae@example.com', 'N', 'C', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
