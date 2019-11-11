-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 09:16 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perfume_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `account_status` int(11) DEFAULT NULL COMMENT '0 - Locked; 1 - Active',
  `role_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `username`, `password`, `account_status`, `role_id`) VALUES
(1, 'han123', '74cd6796eabf5b8296b530d7a605d254', 1, 2),
(2, 'thanh012', '390ba5f6b5f18dd4c63d7cda170a0c74', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(200) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `created at` varchar(200) DEFAULT NULL,
  `brand_status` int(11) DEFAULT NULL COMMENT '0 - Locked; 1 - Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `country_code`, `created at`, `brand_status`) VALUES
(1, 'Chanel', 3, '2019-01-08', 1),
(2, 'Victoria Secret', 2, '2019-08-03', 1),
(3, 'Lolita', 3, '2019-02-07', 1),
(4, 'Versace', 6, '2019-05-01', 1),
(5, 'Dior', 3, '2019-10-07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `category_status` int(11) DEFAULT NULL COMMENT '0 - Locked; 1 - Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'female', 1),
(2, 'male', 1),
(3, 'children', 1),
(4, 'unisex', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_code` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country_status` int(11) DEFAULT NULL COMMENT '0 - Locked; 1 - Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_code`, `name`, `country_status`) VALUES
(1, 'Viet Nam', 1),
(2, 'USA', 1),
(3, 'France', 1),
(4, 'Korea', 1),
(5, 'UK', 1),
(6, 'Italy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deliveryinfo`
--

CREATE TABLE `deliveryinfo` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `receiver_name` varchar(200) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL COMMENT '0 - Cash on Delivery; 1 - Internet Banking; 2 - Visa, Mastercard,...',
  `delivery_method` int(11) DEFAULT NULL COMMENT '0 - Normal delivery; 1 - Fast Delivery',
  `delivery_status` int(11) DEFAULT NULL COMMENT '0 - Packaging; 1 - Delivering; 2 - Delivered; 3 - Postponed; 4 - Failed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deliveryinfo`
--

INSERT INTO `deliveryinfo` (`delivery_id`, `order_id`, `receiver_name`, `address`, `payment_method`, `delivery_method`, `delivery_status`) VALUES
(1, 1, 'Nguyen Van Thanh', '127 Hoang Van Thu, tp Hai Phong', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favlist`
--

CREATE TABLE `favlist` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favlist`
--

INSERT INTO `favlist` (`user_id`, `product_id`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_status` int(11) DEFAULT NULL COMMENT '0 - Received; 1 - Processing; 2 - Processed; 3 - Canceled',
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_status`, `created_at`) VALUES
(1, 1, 1, '2019-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `product_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `product_price`) VALUES
(1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `original_price` double DEFAULT NULL,
  `current_price` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `product_status` int(11) DEFAULT NULL COMMENT 'Product Status: 0 - Out of stock; 1 - In stock; 2 - less than 20',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `volume`, `category_id`, `brand_id`, `original_price`, `current_price`, `description`, `product_status`, `created_at`) VALUES
(1, 'N°5 L’EAU', 100, 1, 1, 135, 135, 'A modern, fresh, and vibrant embodiment of the now and forever scent. Timeless and audacious, simple and sophisticated. N°5 L’EAU is the N°5 of today.\r\n\r\nThe Classic Bottle features a new continuous-misting spray, while the beveled glass appears crystal clear like pure water—an expression of simplicity and elegance.', 1, '2019-10-01 15:54:29'),
(2, 'Lolita Lempicka Lolita Lempicka', 100, 1, 3, 89, 99, 'Some Description', 0, '2019-10-01 15:54:29'),
(3, 'Victoria\'s Secret Bombshell\r\n', 100, 1, 2, 70, 70, 'Some description', 1, '2019-10-01 15:54:43'),
(4, 'ALLURE HOMME SPORT Eau de Toilette', 100, 2, 1, 95, 95, 'A vivacious, energizing fragrance spiked with heightened notes of freshness and sensuality. For the man who loves the great outdoors and lives his life with style.', 1, '2019-10-01 15:54:43'),
(5, 'Dior Sauvage EDT', 100, 2, 5, 90, 100, NULL, 1, '2019-10-07 15:29:16'),
(6, 'Victoria’s Secret Love', 100, 1, 2, 90, 90, NULL, 1, '2019-10-07 20:21:42'),
(7, 'Victoria’s Secret Heavenly', 50, 1, 2, 45, 50, NULL, 1, '2019-10-07 20:24:16'),
(8, 'Victoria’s Secret Angel', 100, 1, 2, 70, 70, NULL, 1, '2019-10-07 20:28:23'),
(9, 'Victoria’s Secret Wicked', 100, 1, 2, 70, 75, NULL, 1, '2019-10-07 20:28:23'),
(10, 'Victoria’s Secret Gorgeous', 100, 1, 2, 90, 90, NULL, 1, '2019-10-07 21:04:21'),
(11, 'Victoria’s Secret Very Sexy For Him 2', 50, 2, 2, 60, 70, NULL, 1, '2019-10-07 21:04:21'),
(12, 'Victoria’s Secret Very Sexy Now Wild Palm', 100, 1, 2, 100, 100, NULL, 1, '2019-10-07 21:10:48'),
(13, 'Victoria’s Secret Intense', 100, 1, 2, 95, 100, NULL, 1, '2019-10-07 21:10:48'),
(14, 'Victoria’s Secret Rose Caramel', 100, 1, 2, 110, 110, NULL, 1, '2019-10-07 21:21:23'),
(16, 'GABRIELLE CHANEL ESSENCE Eau de Parfum', 100, 1, 1, 135, 135, ' Inspired by the free and passionate woman who became Coco Chanel, GABRIELLE CHANEL ESSENCE is a more voluptuous, intensely feminine interpretation of the luminous floral fragrance. The striking square glass bottle is reimagined with bolder golden accents on the cap and label.', 1, '2019-10-08 10:16:02'),
(17, 'COCO MADEMOISELLE Eau de Parfum Intense', 100, 1, 1, 145, 145, 'An intense new facet of the COCO MADEMOISELLE personality emerges to forge a powerful, deep, addictive fragrance that is irresistible in every way.', 1, '2019-10-08 10:27:18'),
(18, 'COCO MADEMOISELLE Eau de Toilette', 100, 1, 1, 107, 107, 'Strong yet surprisingly fresh in character, this decidedly modern Oriental fragrance recalls the irrepressible spirit of a young Coco Chanel.', 1, '2019-10-08 10:27:19'),
(19, 'BLEU DE CHANEL Eau de Parfum', 100, 2, 1, 120, 120, 'Unexpected and undeniably bold. Fresh, clean, and profoundly sensual, the woody, aromatic fragrance reveals the spirit of a man who chooses his own destiny with independence and determination—a man who defies convention.', 1, '2019-10-08 10:27:19'),
(20, 'BLEU DE CHANEL Eau de Toilette', 100, 2, 1, 95, 95, 'A woody, aromatic fragrance for the man who defies convention; a provocative blend of citrus and woods that liberates the senses. Fresh, clean, and profoundly sensual.', 1, '2019-10-08 10:27:19'),
(21, 'BLEU DE CHANEL PARFUM', 100, 2, 1, 150, 150, 'The most intense of the BLEU DE CHANEL fragrances. Powerful and refined, BLEU DE CHANEL Parfum for men reveals the essence of determination.', 1, '2019-10-08 10:27:19'),
(22, 'CHANCE Eau de Parfum', 100, 1, 1, 135, 135, 'Unpredictable, in perpetual movement, the unexpected floral fragrance sweeps you into its whirlwind of happiness and fantasy.', 1, '2019-10-08 10:27:19'),
(23, 'CHANCE EAU FRAÎCHE Eau de Toilette', 100, 1, 1, 107, 107, 'A fresh, sparkling floral expression of CHANCE—a surge of energy that sweeps you into a whirlwind of happiness and fantasy.', 1, '2019-10-08 10:27:19'),
(25, 'Dior J’Adore', 5, 1, 5, 17.3, 17.1, 'This female Dior perfume opens with a floral scent combining magnolia, jasmine and pear when ripe, bringing a crisp and completely fresh feeling.', 1, '2019-10-08 11:10:00'),
(26, 'Dior Addict eau fraiche 2014', 5, 1, 5, 19, 18, 'Dior Addict Eau Fraiche 2014 opens with a formula of fruity and floral notes that bring a fresh, lively and full of aspiration.', 1, '2019-10-08 11:10:00'),
(27, 'Dior Sauvage', 100, 2, 5, 152, 144, 'This is a male perfume with a complex mix of spicy, sweet and cool flavors, making the scent more special, contributing to the beauty of the man.', 1, '2019-10-08 11:10:00'),
(28, 'Dior Homme Sport', 100, 2, 5, 112, 107, 'A luxurious fresh fragrance combined with the traditional fragrance design of Dior. This simple style design is made of transparent glass to reveal a thick and black perfume tube, in line with Dior\\\'s style.', 1, '2019-10-08 11:10:00'),
(29, 'Miss Dior Cherie Blooming Bouquet', 150, 1, 5, 169, 157, 'The scent includes peony-enhanced fragrance formula combined with the formation of vivid rose scent. This scent has highlighted the timeless splendor with the smoothness and juicy nuances of the fragrance between peach blossom and apricot blossom.', 1, '2019-10-08 11:10:00'),
(30, ' Dior Hypnotic Poison', 100, 1, 5, 128, 123, 'This fragrance is emphasized by the opening with a sweet sambac jasmine fragrance and then slowly slips down and adorned with elegant musk and vanilla.', 1, '2019-10-08 11:10:00'),
(31, 'Dior Absolutely Blooming', 50, 1, 5, 112, 108, 'Miss Dior Absolute Blooming perfume starts with a fresh fragrance from the group of citrus trees, Italian tangerines are very gentle and relaxing. Next comes the spread of Egyptian jasmine, a sweet floral fragrance, combined with the classic rose scent in the middle notes.', 1, '2019-10-08 11:10:00'),
(32, 'Miss Dior Cherie Eau de Parfum', 100, 1, 5, 102, 85, 'Miss Dior Cherie women\\\'s perfume begins with a combination of the sweet fragrance of strawberries and the faint aroma of mandarin. Next is the middle layer with sugar flavor that has a very light caramel flavor, creating a warmer feeling while preserving the sweetness of the first layer.', 1, '2019-10-08 11:10:00'),
(33, 'Dior Homme Cologne 2013', 125, 2, 5, 130, 130, 'Dior Homme Cologne 2013 fragrance opens with fresh orange fragrance, after about 10 - 15p will be the rise of sophisticated, modern grapefruit fragrance. In the end will be the fragrance of musk.\\r\\n\\r\\nThe combination of this combination will give this masculine fragrance a quite special scent like the Grapefruit Cocktail flavor that brings a very refreshing feeling, while giving a fresh impression. like the feeling of a pure white cotton shirt and feeling full of life', 1, '2019-10-08 11:10:00'),
(34, 'Dior Fahrenheit', 100, 2, 5, 112, 106, 'Dior Fahrenheit perfume starts with a vivid honeysuckle fragrance combined with bergamot and soft hawthorn aroma. This is considered a sharp but fleeting scent with floral scent opening beginning long lasting fragrance combined with violets and nutmeg', 1, '2019-10-08 11:10:00'),
(35, 'Versace Eros', 100, 1, 4, 50.24, 50.24, 'Eros interprets the sublime masculine through a luminous aura with an intense, vibrant, and glowing combination of fresh mint leaves, Italian lemon zest, and green apple. An addictive sensuality accented by oriental, intriguing, and enveloping notes like tonka beans, amrboxan amber, geranium flower, and vanilla melds with a racy virility symbolized by woods—such as cedarwood from Atlas and Virginia—while vetiver and oak moss provide intensity and power.', 1, '2019-10-07 22:05:38'),
(36, 'Versace Yellow Diamond', 100, 1, 4, 63.99, 59.99, 'Infinite beauty reflects itself in the transparency of a diamond and radiates all around in beams of crystalline light. Pure as sunlight, a bright, extraordinary yellow light radiates with a fiery intensity and sparkles the way that only a diamond can. An authentic jewel of rare beauty is unveiled in Yellow Diamond, a fresh and vivid floral perfume by Versace.', 1, '2019-10-07 22:07:59'),
(37, 'Versace Crystal Noir', 100, 2, 4, 59.99, 55.99, 'A fragrance for the true Versace woman. She’s effortlessly sexy, confident, and loves fashion, sumptuousness, and eccentricity. The fragrance is a magical perfume, sheer and sensual at the same time. A floral-oriental scent, it’s absolutely feminine, gentle, and leaves a lasting impression.\\r\\n', 1, '2019-10-07 22:12:48'),
(38, 'Versace Pour Homme', 100, 2, 4, 65.99, 65.99, 'The new fragrance for men, Versace Pour Homme, blends essential ingredients of Mediterranean origin to hit aromatic notes that match the man of today: knowledgeable and self-confident, he has the ability to live in harmony with the natural world. Dynamic and entrepreneurial, the Versace Pour Homme man communicates his forceful and passionate character through this decidedly masculine fragrance.\\r\\n', 1, '2019-10-07 22:14:20'),
(39, 'Versace Man', 100, 2, 4, 84.99, 84.99, 'This fresh, sexy interpretation of the Versace Man fragrance is a softer, more subtly sexy version of the original. Smooth fruits spiced with green leaves and warm notes of musk, amber, and sycamore wood, make this a scent for today\\\'s more introspective man.', 1, '2019-10-07 22:15:45'),
(40, 'Versace Pour Homme Dylan Blue', 100, 2, 4, 69.99, 69.99, 'Dylan Blue is the new fragrance that captivates the sensual scents of the Mediterranean. Woody notes of ambrox evoke tradition, while exquisite citrus- bergamot and grapefruit, give off modernity. Aquatic hints add invigorating freshness. Enveloping notes of black pepper, papyrus wood and incense bestow masculinity, forming the fragrance\\\'s pulsating heart. The base is accentuated in a combination of seductive mineral musk, tonka beans, and saffron- recalling a man\\\'s individuality.\\r\\n\\r\\n', 1, '2019-10-07 22:17:27'),
(41, 'Versace Eros Flame', 100, 2, 4, 99.99, 99.99, 'Versace Eros Flame the new men’s fragrance, strikes you right through the heart—a hesperidic, amber, woody fragrance to make the wearer feel strong, passionate, self-confident, and very Versace.', 1, '2019-10-07 22:19:37'),
(42, 'Versace Bright Crystal', 100, 1, 4, 89.99, 89.99, 'Inspired by a mixture of Donatella Versace\\\'s favorite floral fragrances, Bright Crystal is a fresh, sensual blend of refreshing chilled yuzu and pomegranate mingled with soothing blossoms of peony, magnolia, and lotus flower, warmed with notes of musk and amber.', 1, '2019-10-07 22:20:49'),
(43, 'Versace Woman', 100, 1, 4, 47.99, 47.99, 'Introduced in 2000, Versace Woman is a crisp, vibrant scent for women who understand the importance of first impressions. This elegant eau de parfum spray features a blend of fruity and floral accords to set hearts aflutter wherever you may roam. Top notes of jasmine leaf and rose give the scent a flowery beginning, while a heart composed of raspberry and plum lend the composition an orchard-fresh vibe. Musky hints on the dry down cling to your skin, leaving you feeling uber feminine.', 1, '2019-10-07 22:22:11'),
(44, 'Vanitas Versace', 100, 1, 4, 54.99, 54.99, 'It is recommended for daily use. Long lasting fragrance for all skin types. This is high quality product made of high quality material.', 1, '2019-10-07 22:23:05'),
(45, 'Lolita Lempicka Le Premier Parfum', 50, 1, 3, 1, 1, 'Các thành phần được lựa chọn cho Le Premier Parfum được tái phát minh và thăng hoa trong phiên bản này. Các note vanilla mở ra nhờ vào các thành phần mạnh mẽ và ngọt ngào, thể hiện sự nữ tính và gợi cảm. Ngoài vanilla được tích hợp trong trạng thái nguyên thủy nhất của nó, hương nước hoa của Lolita Lempicka Le Premier Parfum mở ra với rượu liquorice, kết hợp với mùi hương của violet, hoa nhài và tuyết tùng. Ở phía sau, mùi thơm của đậu tonka hòa lẫn với nhiệt độ tươi mát của họ nhà chanh. Chiếc chai hình tượng có hình quả táo có màu tím đậm, một loại amethyst với màu sắc thay đổi, phản phất với các hiệu ứng ánh sáng nhờ bao bọc bằng kim loại. Toàn bộ được trang trí bằng những chiếc lá khắc trên nền và một huy hiệu màu vàng ủng hồng.', 1, '2019-10-08 13:37:11'),
(46, 'Lolita Lempicka So Sweet EDP (2016)', 50, 1, 3, 420, 420, 'Nếu bạn yêu thích một loại nước hoa có nhiều sắc nét và vui nhộn và ngọt ngào thì Lolita Lempicka So Sweet có thể dành cho bạn. Hương nước hoa này dành cho người phụ nữ chỉ yêu một chút ngọt ngào nhưng đầy cá tính đặc trưng.', 1, '2019-10-08 13:37:11'),
(47, 'Lolita Lempicka Minuit Sonne', 50, 1, 3, 1, 1, 'Hương thơm của chai nước hoa này khá nồng nàn nhưng cũng rất tươi sáng, một hương thơm dễ dàng gây nghiện với bất cứ ai khi chạm phải. Lolita Lempicka Minuit Sonne thuộc nhóm hương gỗ phương Đông với hương thơm đặc trưng của hoa cam thảo, sự gợi cảm của hương hoa iris, thoáng chút mùi hương hoa nhài và sự hòa quyện tinh tế của vani, benzoin và nhựa thơm. Lọ nước hoa pha lê trong hình dáng một quả táo long lanh đầy gọi mời điểm xuyết những hoa văn  trang trí lấp lánh như ánh sao trắng giữa màn đêm bí ẩn. Các chi tiết được phủ ánh bạc càng tăng vẻ đẹp sang trọng và huyền ảo của lọ nước hoa Lolita Lempicka Minuit Sonne.', 1, '2019-10-08 13:37:11'),
(48, 'Lolita Lempicka For Women EDT', 50, 1, 3, 390, 390, 'Lolita Lempicka For Women EDT ra mắt năm 1997. Một phiên bản mùa hè nhẹ nhàng hơn của loại nước hoa nổi tiếng này có thêm thường xuân và hương hồi như những nốt hương đệm thêm cho mống mắt và hoa tím, trong khi xạ hương, cỏ vertiver, vanilla, đậu tonka là những thành phần làm nên sự lưu luyến quẩn quanh trên da qua lớp hương cuối của nó.', 1, '2019-10-08 13:37:11'),
(49, 'Lolita Lempicka L’Eau en Blanc', 50, 1, 3, 1, 1, 'Lolita Lempicka ra mắt một loại nước hoa mới có tên L’Eau en Blanc vào tháng 5 năm 2012. Nước hoa L’Eau en Blanc thể hiện sự nồng nàng, lãng mạn, quyến rũ. Nó được lấy cảm hứng từ hương thơm của loài hoa Violet màu trắng, làm mùi hương chủ đạo. Hương đầu là sự kết hợp của hoa Irit và lá Violet. Hương giữa là hương ngọt ngào của hoa Violet, quả mâm xôi, quả Cherry chua và Cam thảo. Cuối cùng là hương mang đậm phong cách Phương Đông của cỏ Vetiver, đậu Tonka, cây vòi voi và Xạ hương.', 1, '2019-10-08 13:37:11'),
(50, 'Lolita Lempicka Eau De Minuit Midnight Fragrance P', 50, 1, 3, 1, 1, 'Lolita Lempicka cho ra mắt bộ sưu tập mới Eau de Minuit cho năm 2012 với tên gọi Illusions Noires, đây là dòng sản phẩm giới hạn của các bản gốc là: Le Premier Parfum, Si Lolita and Au Masculin – Le Premier Parfum, Si Lolita and Au Masculin. Eau de Minuit mang đậm phong cách phương đông với các hương thơm đặc trưng: nhựa thơm, hoa nhài Sambac, iris, cam thảo, vani, benzoin.', 1, '2019-10-08 13:37:11'),
(51, 'Lolita Lempicka Sweet EDP', 50, 1, 3, 1, 1, 'Hãng Lolita vừa cho ra đời hương thơm mới mang tên tên Lolita Lempicka Sweet vào giữa 10/2014.Một hương thơm đầy gợi cảm, cuốn hút dành cho phái nữ. Sweet tượng trung cho sự nữ tính và niềm vui vẻ bên trong tâm hồn của người phụ nữ. Mùi hương này được chuyên gia Anne Flipo sáng tạo dựa trên nền tảng của những quả anh đào chín đỏ mọng nước, chứa đựng thông điệp của một nụ hôn. Thiết kế chai hình trái tim màu đỏ như mang sự ấm áp, tươi vui đến cho người phụ nữ.', 1, '2019-10-08 13:37:11'),
(52, 'Lolita Lempicka Elle L’aime', 50, 1, 3, 1, 1, 'Lolita Lempicka vừa cho ra đời mùi hương mới mang tên Lolita Lempicka Elle L’aime vào tháng chín năm 2013, một sản phẩm chứa đựng mùi hương đầy gợi cảm và nữ tính. Trái tim của chai nước hoa và mùi hương gợi cảm, ấm áp mang hơi thở phương Đông huyền bí. Vỏ chai lung linh như một viên ngọc sáng với thiết kế và màu sắc giúp người phụ nữ tỏa sáng như đang yêu.', 1, '2019-10-08 13:37:11'),
(53, 'Lolita Lempicka  Le Premier Parfum EDP 7ml', 50, 1, 3, 570, 570, 'Sản phẩm nước hoa đầu tiên cùng tên của thương hiệu Lolita Lempicka được sáng tạo bởi chuyên gia Annick Menardo vào năm 1997 với hương cam thảo giữ vai trò chủ đạo. Sau đó sản phẩm này được dừng sản xuất và được ra mắt lại với một cái tên mới là Lolita Lempicka Le Premier Parfum vào năm 2010.', 1, '2019-10-08 13:37:11'),
(54, 'Lolita Lempicka Sweet EDP 7ml', 50, 1, 3, 570, 570, 'Sản phẩm nước hoa đầu tiên cùng tên của thương hiệu Lolita Lempicka được sáng tạo bởi chuyên gia Annick Menardo vào năm 1997 với hương cam thảo giữ vai trò chủ đạo. Sau đó sản phẩm này được dừng sản xuất và được ra mắt lại với một cái tên mới là Lolita Lempicka Le Premier Parfum vào năm 2010.', 1, '2019-10-08 13:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `product_img_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_img`
--

INSERT INTO `product_img` (`img_id`, `product_id`, `url`, `product_img_status`) VALUES
(1, 1, '1_0.jpg', 1),
(2, 2, '2_0.jpg', 1),
(3, 3, '3_0.jpg', 1),
(4, 4, '4_0.jpg', 1),
(6, 6, '6_0.jpg', 1),
(7, 7, '7_0.jpg', 1),
(8, 8, '8_0.jpg', 1),
(9, 9, '9_0.jpg', 1),
(10, 10, '10_0.jpg', 1),
(11, 11, '11_0.jpg', 1),
(12, 12, '12_0.jpg', 1),
(13, 13, '13_0.jpg', 1),
(14, 14, '14_0.jpg', 1),
(16, 16, '16_0.jpg', 1),
(17, 17, '17_0.jpg', 1),
(18, 18, '18_0.jpg', 1),
(19, 19, '19_0.jpg', 1),
(20, 20, '20_0.jpg', 1),
(21, 21, '21_0.jpg', 1),
(22, 22, '22_0.jpg', 1),
(23, 23, '23_0.jpg', 1),
(25, 25, '25_0.jpg', 1),
(26, 26, '26_0.jpg', 1),
(27, 27, '27_0.jpg', 1),
(28, 28, '28_0.jpg', 1),
(29, 29, '29_0.jpg', 1),
(30, 30, '30_0.jpg', 1),
(31, 31, '31_0.jpg', 1),
(32, 32, '32_0.jpg', 1),
(33, 33, '33_0.jpg', 1),
(34, 34, '34_0.jpg', 1),
(35, 35, '35_0.jpg', 1),
(36, 36, '36_0.jpg', 1),
(37, 37, '37_0.jpg', 1),
(38, 38, '38_0.jpg', 1),
(39, 39, '39_0.jpg', 1),
(40, 40, '40_0.jpg', 1),
(41, 41, '41_0.jpg', 1),
(42, 42, '42_0.jpg', 1),
(43, 43, '43_0.jpg', 1),
(44, 44, '44_0.jpg', 1),
(45, 45, '45_0.jpg', 1),
(46, 46, '46_0.jpg', 1),
(47, 47, '47_0.jpg', 1),
(48, 48, '48_0.jpg', 1),
(49, 49, '49_0.jpg', 1),
(50, 50, '50_0.jpg', 1),
(51, 51, '51_0.jpg', 1),
(52, 52, '52_0.jpg', 1),
(53, 53, '53_0.jpg', 1),
(54, 54, '54_0.jpg', 1),
(55, 5, '5_0.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_status` int(11) DEFAULT NULL COMMENT '0 - Locked; 1 - Active',
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `address`, `phone`, `email`, `profile_picture`, `created_at`, `user_status`, `account_id`) VALUES
(1, 'Nguyen Van Thanh', 'Hoang Van Thu, tp Hai Phong', '01257945621', 'duc1234@gmail.com', NULL, '2019-10-07 08:23:29', 1, 1),
(5, 'Kieu Hieu Thanh', '8th Street, An Khanh Ward, Ninh Kieu District, Cantho City ', '0348204069', 'thanhkhce140026@fpt.edu.vn', NULL, '2019-11-10 04:51:30', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `user_role_status` int(11) DEFAULT NULL COMMENT '0 - Locked; 1 - Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `role_name`, `user_role_status`) VALUES
(1, 'user', 1),
(2, 'mod', 1),
(3, 'manager', 1),
(4, 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_code`);

--
-- Indexes for table `deliveryinfo`
--
ALTER TABLE `deliveryinfo`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `favlist`
--
ALTER TABLE `favlist`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deliveryinfo`
--
ALTER TABLE `deliveryinfo`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`);

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `countries` (`country_code`);

--
-- Constraints for table `deliveryinfo`
--
ALTER TABLE `deliveryinfo`
  ADD CONSTRAINT `deliveryinfo_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `favlist`
--
ALTER TABLE `favlist`
  ADD CONSTRAINT `favlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

--
-- Constraints for table `product_img`
--
ALTER TABLE `product_img`
  ADD CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
