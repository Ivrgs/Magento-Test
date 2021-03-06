-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2021 at 02:17 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_magento`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminnotification_inbox`
--

CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) UNSIGNED NOT NULL COMMENT 'Notification id',
  `severity` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text DEFAULT NULL COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Flag if notification read',
  `is_remove` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Flag if notification might be removed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';

-- --------------------------------------------------------

--
-- Table structure for table `admin_assert`
--

CREATE TABLE `admin_assert` (
  `assert_id` int(10) UNSIGNED NOT NULL COMMENT 'Assert ID',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert Type',
  `assert_data` text DEFAULT NULL COMMENT 'Assert Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Assert Table';

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Parent Role ID',
  `tree_level` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Role Tree Level',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, 'Administrators'),
(2, 1, 2, 0, 'U', 1, 'Ivan');

-- --------------------------------------------------------

--
-- Table structure for table `admin_rule`
--

CREATE TABLE `admin_rule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule ID',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Assert ID',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role Type',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';

--
-- Dumping data for table `admin_rule`
--

INSERT INTO `admin_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `assert_id`, `role_type`, `permission`) VALUES
(1, 1, 'all', NULL, 0, 'G', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) DEFAULT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'User Is Active',
  `extra` text DEFAULT NULL COMMENT 'User Extra Data',
  `rp_token` text DEFAULT NULL COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin User Table';

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`) VALUES
(1, 'Ivan', 'Vargas', 'rodelivan@growth-rocket.com', 'Ivrgs', 'ab490b1bb9b7023208df718306835cd6f6acf4ba096d47ecd109073c4ff4ad7c:xtNlExzddZoj6mcA0DZRReqcix6TzbI6', '2021-07-26 01:30:26', '2021-07-26 01:30:26', '2021-11-18 22:24:06', 59, 0, 1, 'a:1:{s:11:\"configState\";a:54:{s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"0\";s:13:\"design_header\";s:1:\"0\";s:13:\"design_footer\";s:1:\"1\";s:16:\"design_watermark\";s:1:\"0\";s:17:\"design_pagination\";s:1:\"1\";s:12:\"design_email\";s:1:\"1\";s:15:\"general_country\";s:1:\"0\";s:14:\"general_region\";s:1:\"0\";s:14:\"general_locale\";s:1:\"1\";s:25:\"general_store_information\";s:1:\"1\";s:16:\"currency_options\";s:1:\"1\";s:29:\"currency_currencyconverterapi\";s:1:\"1\";s:16:\"currency_fixerio\";s:1:\"1\";s:15:\"currency_import\";s:1:\"1\";s:25:\"trans_email_ident_general\";s:1:\"1\";s:23:\"trans_email_ident_sales\";s:1:\"1\";s:25:\"trans_email_ident_support\";s:1:\"1\";s:25:\"trans_email_ident_custom1\";s:1:\"1\";s:25:\"trans_email_ident_custom2\";s:1:\"1\";s:16:\"catalog_frontend\";s:1:\"1\";s:15:\"catalog_sitemap\";s:1:\"1\";s:14:\"catalog_review\";s:1:\"0\";s:21:\"catalog_product_image\";s:1:\"1\";s:20:\"catalog_productalert\";s:1:\"0\";s:25:\"catalog_productalert_cron\";s:1:\"0\";s:19:\"catalog_placeholder\";s:1:\"1\";s:25:\"catalog_recently_products\";s:1:\"0\";s:13:\"catalog_price\";s:1:\"0\";s:26:\"catalog_layered_navigation\";s:1:\"0\";s:11:\"catalog_seo\";s:1:\"1\";s:18:\"catalog_navigation\";s:1:\"0\";s:14:\"catalog_search\";s:1:\"1\";s:20:\"catalog_downloadable\";s:1:\"1\";s:22:\"catalog_custom_options\";s:1:\"1\";s:12:\"dev_restrict\";s:1:\"1\";s:9:\"dev_debug\";s:1:\"1\";s:20:\"dev_translate_inline\";s:1:\"0\";s:7:\"dev_log\";s:1:\"0\";s:6:\"dev_js\";s:1:\"0\";s:7:\"dev_css\";s:1:\"0\";s:20:\"easypathhints_option\";s:1:\"1\";s:7:\"web_url\";s:1:\"1\";s:7:\"web_seo\";s:1:\"1\";s:12:\"web_unsecure\";s:1:\"0\";s:10:\"web_secure\";s:1:\"0\";s:11:\"web_default\";s:1:\"1\";s:9:\"web_polls\";s:1:\"0\";s:10:\"web_cookie\";s:1:\"0\";s:11:\"web_session\";s:1:\"0\";s:24:\"web_browser_capabilities\";s:1:\"0\";s:11:\"cms_wysiwyg\";s:1:\"1\";s:23:\"newsletter_subscription\";s:1:\"1\";}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_attribute`
--

CREATE TABLE `api2_acl_attribute` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `user_type` varchar(20) NOT NULL COMMENT 'Type of user',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `operation` varchar(20) NOT NULL COMMENT 'Operation',
  `allowed_attributes` text DEFAULT NULL COMMENT 'Allowed attributes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Filter ACL Attributes';

-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_role`
--

CREATE TABLE `api2_acl_role` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `role_name` varchar(255) NOT NULL COMMENT 'Name of role'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Roles';

--
-- Dumping data for table `api2_acl_role`
--

INSERT INTO `api2_acl_role` (`entity_id`, `created_at`, `updated_at`, `role_name`) VALUES
(1, '2021-07-26 09:29:56', NULL, 'Guest'),
(2, '2021-07-26 09:29:56', NULL, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_rule`
--

CREATE TABLE `api2_acl_rule` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role ID',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `privilege` varchar(20) DEFAULT NULL COMMENT 'ACL Privilege'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Rules';

-- --------------------------------------------------------

--
-- Table structure for table `api2_acl_user`
--

CREATE TABLE `api2_acl_user` (
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT 'Admin ID',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Users';

-- --------------------------------------------------------

--
-- Table structure for table `api_assert`
--

CREATE TABLE `api_assert` (
  `assert_id` int(10) UNSIGNED NOT NULL COMMENT 'Assert id',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert type',
  `assert_data` text DEFAULT NULL COMMENT 'Assert additional data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';

-- --------------------------------------------------------

--
-- Table structure for table `api_role`
--

CREATE TABLE `api_role` (
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Parent role id',
  `tree_level` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Role level in tree',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort order to display on admin area',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role type',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User id',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';

-- --------------------------------------------------------

--
-- Table structure for table `api_rule`
--

CREATE TABLE `api_rule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Api rule Id',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Api role Id',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Module code',
  `api_privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Assert id',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role type',
  `api_permission` varchar(10) DEFAULT NULL COMMENT 'Permission'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';

-- --------------------------------------------------------

--
-- Table structure for table `api_session`
--

CREATE TABLE `api_session` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User id',
  `logdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Login date',
  `sessid` varchar(40) DEFAULT NULL COMMENT 'Sessioin id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';

-- --------------------------------------------------------

--
-- Table structure for table `api_user`
--

CREATE TABLE `api_user` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User id',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'First name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'Last name',
  `email` varchar(128) DEFAULT NULL COMMENT 'Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'Nickname',
  `api_key` varchar(255) DEFAULT NULL COMMENT 'Api key',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User record create date',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User record modify date',
  `lognum` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quantity of log ins',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Refresh ACL flag',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Account status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';

-- --------------------------------------------------------

--
-- Table structure for table `captcha_log`
--

CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock`
--

CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';

--
-- Dumping data for table `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` (`stock_id`, `stock_name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_item`
--

CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Backorders',
  `use_config_backorders` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT 1.0000 COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Divided into Multiple Boxes for Shipping'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';

--
-- Dumping data for table `cataloginventory_stock_item`
--

INSERT INTO `cataloginventory_stock_item` (`item_id`, `product_id`, `stock_id`, `qty`, `min_qty`, `use_config_min_qty`, `is_qty_decimal`, `backorders`, `use_config_backorders`, `min_sale_qty`, `use_config_min_sale_qty`, `max_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `notify_stock_qty`, `use_config_notify_stock_qty`, `manage_stock`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `qty_increments`, `use_config_enable_qty_inc`, `enable_qty_increments`, `is_decimal_divided`) VALUES
(7, 7, 1, '98.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(8, 8, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(9, 9, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(10, 10, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(11, 11, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(12, 12, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(13, 13, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(14, 14, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(15, 15, 1, '99.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status`
--

CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Dumping data for table `cataloginventory_stock_status`
--

INSERT INTO `cataloginventory_stock_status` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(7, 1, 1, '98.0000', 1),
(8, 1, 1, '99.0000', 1),
(9, 1, 1, '99.0000', 1),
(10, 1, 1, '99.0000', 1),
(11, 1, 1, '99.0000', 1),
(12, 1, 1, '99.0000', 1),
(13, 1, 1, '99.0000', 1),
(14, 1, 1, '99.0000', 1),
(15, 1, 1, '99.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

INSERT INTO `cataloginventory_stock_status_idx` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(7, 1, 1, '98.0000', 1),
(8, 1, 1, '99.0000', 1),
(9, 1, 1, '99.0000', 1),
(10, 1, 1, '99.0000', 1),
(11, 1, 1, '99.0000', 1),
(12, 1, 1, '99.0000', 1),
(13, 1, 1, '99.0000', 1),
(14, 1, 1, '99.0000', 1),
(15, 1, 1, '99.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule`
--

CREATE TABLE `catalogrule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` mediumtext DEFAULT NULL COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext DEFAULT NULL COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Stop Rules Processing',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount For Subitems'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';

--
-- Dumping data for table `catalogrule`
--

INSERT INTO `catalogrule` (`rule_id`, `name`, `description`, `from_date`, `to_date`, `is_active`, `conditions_serialized`, `actions_serialized`, `stop_rules_processing`, `sort_order`, `simple_action`, `discount_amount`, `sub_is_enable`, `sub_simple_action`, `sub_discount_amount`) VALUES
(1, 'Default', NULL, '2021-09-10', NULL, 1, 'a:7:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";s:10:\"conditions\";a:1:{i:0;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:12:\"category_ids\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"9\";s:18:\"is_value_processed\";b:0;}}}', 'a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}', 0, 1, 'by_percent', '34.0000', 1, 'by_percent', '34.0000');

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_affected_product`
--

CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Affected Product';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_customer_group`
--

CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

--
-- Dumping data for table `catalogrule_customer_group`
--

INSERT INTO `catalogrule_customer_group` (`rule_id`, `customer_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website`
--

CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rule Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product`
--

CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Product Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rule Id',
  `from_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'From Time',
  `to_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'To time',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Group Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Action Stop',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount For Subitems'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price`
--

CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Group Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Rule Price',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_website`
--

CREATE TABLE `catalogrule_website` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

--
-- Dumping data for table `catalogrule_website`
--

INSERT INTO `catalogrule_website` (`rule_id`, `website_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_fulltext`
--

CREATE TABLE `catalogsearch_fulltext` (
  `fulltext_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `data_index` longtext DEFAULT NULL COMMENT 'Data index'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';

--
-- Dumping data for table `catalogsearch_fulltext`
--

INSERT INTO `catalogsearch_fulltext` (`fulltext_id`, `product_id`, `store_id`, `data_index`) VALUES
(260, 15, 1, 'None|Little Nightmares 2|Little Nightmares II is a suspense-adventure game in which you play as Mono, a young boy trapped in a world that has been distorted by the humming transmission of a distant tower. With Six, the girl in a yellow raincoat, as his guide, Mono sets out to discover the dark secrets of The Signal Tower and save Six from her terrible fate. But their journey will not be straightforward as Mono and Six will face a gallery of new threats from the terrible residents of this world. Will you dare to face this collection of new, little nightmares?||899.99|1'),
(259, 14, 1, 'None|Tom Clancy\'s Ghost Recon Wildlands|Create a team with up to 3 friends in Tom Clancy???s Ghost Recon?? Wildlands and enjoy the ultimate military shooter experience set in a massive, dangerous, and responsive open world. You can also play PVP in 4v4 class-based, tactical fights: Ghost War. TAKE DOWN THE CARTEL In a near future, Bolivia has fallen into the hands of Santa Blanca, a merciless drug cartel who spread injustice and violence. Their objective: to create the biggest Narco-State in history. BECOME A GHOST Create and fully customize your Ghost, weapons, and gear. Enjoy a total freedom of playstyle. Lead your team and take down the cartel, either solo or with up to three friends. EXPLORE BOLIVIA Journey through Ubisoft\'s largest action-adventure open world. Discover the stunning diverse landscapes of the Wildlands both on and off road, in the air, on land, and at sea with over 60 different vehicles. TRUST YOUR EYES Taking out the Santa Blanca Cartel becomes an even richer experience with Tobii Eye Tracking. Features like Extended View, Aim at Gaze and Communications Wheel let you use your natural eye movement to interact with the environment ??? without interrupting or modifying your traditional controls. Now armed with an extensive eye tracking feature set, team communication becomes more seamless, firefights become more intense and exploring your new surroundings becomes an even more immersive adventure. Compatible with all Tobii Eye Tracking gaming devices. ---- Additional notes: Eye tracking features available with Tobii Eye Tracking.||1850|GDrive|1'),
(258, 13, 1, 'None|State of Decay 2 Juggernaut Edition|In State of Decay 2, the quiet stillness of the post-apocalyptic world is interrupted by gruesome horror and grisly violence. If you can\'t defend yourself with the guns, knives, and bats you find while scavenging, you might see your character literally ripped apart by monstrous zombies... or murdered by aggressive NPCs looking to claim your territory! State of Decay 2: Juggernaut Edition re-imagines the popular survival game as a brand-new experience to welcome first-time players... and those who\'ve come back from the dead. Available on Steam for the first time, this edition is packed with new and remastered content for the ultimate zombie survival experience. Join over 10 million existing players and discover what Juggernaut Edition has to offer: The base game plus all three add-on packs released to date, including the all-new Homecoming update: ??? Homecoming: a full-size, fully remastered, open world version of Trumbull Valley for the core game, reintegrating the Mount Tanner and Fairfield regions to the map, and adding new sites to scavenge, along with new sights to behold. ??? Heartland: an massive story campaign set in a familiar town with new challenges ??? Daybreak Pack: a test of teamwork with siege-style, \"survive the horde\" gameplay ??? Independence Pack: a celebration of history that blows up zombies... with fireworks! ??? Remastered graphics and an upgraded engine featuring realistic fog effects ??? An expanded soundtrack with hours of new thematic musical arrangements ??? Providence Ridge: a brand-new open-world map full of forests, zombies, and mystery ??? Two-handed heavy weapons with new melee combat moves to bust zombie heads ??? A new introductory experience and improved controls to help you master the apocalypse ... and countless other improvements to the classic open-ended sandbox gameplay.||749|GDrive|1'),
(252, 7, 1, '12345|None|Days Gone|Set in a post-apocalyptic Oregon two years after the start of a global pandemic, former outlaw-turned-drifter Deacon St. John discovers the possibility of his wife Sarah still being alive, which leads Deacon on a quest to find her. Days Gone is played from a third-person perspective, in which the player can explore an open world environment. Players can use firearms, melee weapons and improvised weapons, and can use stealth to defend against hostile humans and cannibalistic creatures known as Freakers. A major game mechanic is Deacon\'s motorcycle, which is used as the player character\'s primary mode of transportation as well as mobile inventory.||1584|GDrive|1'),
(253, 8, 1, '123|None|Minecraft Bedrock|Create anything you can imagine. Explore randomly generated worlds. Survive dangerous mobs at night. This collection includes the Minecraft base game and the Starter Pack compilation: Greek Mythology Mash-up Plastic Texture Pack Skin Pack 1 Villains Skin Pack Also get 700 Minecoins to use in the in-game Marketplace!||1340|GDrive|1'),
(254, 9, 1, 'None|DOOM Eternal|Hell\'s armies have invaded Earth. Become the Slayer in an epic single-player campaign to conquer demons across dimensions and stop the final destruction of humanity. The only thing they fear... is you. Experience the ultimate combination of speed and power in DOOM Eternal - the next leap in push-forward, first-person combat. Discover the Slayer???s origins and his enduring mission to RAZE HELL||2560|GDrive|1'),
(255, 10, 1, 'None|Forza Horizon 4|Live the Horizon Life when you play Forza Horizon 4. Experience a shared world with dynamic seasons. Explore beautiful scenery, collect over 450 cars and become a Horizon Superstar in historic Britain.||3648|1'),
(256, 11, 1, 'None|Deus EX Mankind Divided|The year is 2029, and mechanically augmented humans have now been deemed outcasts, living a life of complete and total segregation from the rest of society. Now an experienced covert operative, Adam Jensen is forced to operate in a world that has grown to despise his kind. Armed with a new arsenal of state-of-the-art weapons and augmentations, he must choose the right approach, along with who to trust, in order to unravel a vast worldwide conspiracy.||2599|GDrive|1'),
(257, 12, 1, 'None|Call of Duty World War II|Call of Duty: WWII is a 2017 first-person shooter video game developed by Sledgehammer Games and published by Activision. It was released worldwide on November 3, 2017 for Microsoft Windows, PlayStation 4 and Xbox One. It is the fourteenth main installment in the Call of Duty series and the first title in the series to be set primarily during World War II since Call of Duty: World at War in 2008. The game\'s campaign is set in the European theatre and is centered around a squad in the 1st Infantry Division following their battles on the Western Front and set mainly in the historical events of Operation Overlord. The player controls Ronald \"Red\" Daniels, who has squadmates who can supply the player with extra ammunition, health, or grenades as well as a targeted grenade and target spotting; none of these are automatically replenished in the campaign. The multiplayer mode features map locations not seen in the campaign. The mode also features the new Divisions system, replacing the create-a-class system that previous games in the series used. A social hub, Headquarters, was also implemented into the game, allowing for players to interact with each other.||3025|GDrive|1');

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_query`
--

CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) UNSIGNED NOT NULL COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Num results',
  `popularity` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT 1 COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT 0 COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search query table';

--
-- Dumping data for table `catalogsearch_query`
--

INSERT INTO `catalogsearch_query` (`query_id`, `query_text`, `num_results`, `popularity`, `redirect`, `synonym_for`, `store_id`, `display_in_terms`, `is_active`, `is_processed`, `updated_at`) VALUES
(1, 'm', 0, 1, NULL, NULL, 1, 1, 1, 0, '2021-07-29 19:32:00'),
(2, 'minecraft', 1, 2, NULL, NULL, 1, 1, 1, 0, '2021-09-08 22:51:12'),
(3, 'sd', 0, 1, NULL, NULL, 1, 1, 1, 0, '2021-10-18 04:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_result`
--

CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) UNSIGNED NOT NULL COMMENT 'Query ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `relevance` decimal(20,4) NOT NULL DEFAULT 0.0000 COMMENT 'Relevance'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_categs_index_idx`
--

CREATE TABLE `catalog_category_anc_categs_index_idx` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_categs_index_tmp`
--

CREATE TABLE `catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_products_index_idx`
--

CREATE TABLE `catalog_category_anc_products_index_idx` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_anc_products_index_tmp`
--

CREATE TABLE `catalog_category_anc_products_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity`
--

CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attriute Set ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';

--
-- Dumping data for table `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, 0, '2021-07-26 01:30:03', '2021-07-26 01:30:03', '1', 0, 0, 9),
(2, 3, 3, 1, '2021-07-26 01:30:04', '2021-08-01 20:58:42', '1/2', 1, 1, 0),
(4, 3, 3, 1, '2021-08-01 20:52:46', '2021-08-01 21:03:34', '1/4', 3, 1, 7),
(5, 3, 3, 4, '2021-08-01 21:04:11', '2021-09-26 23:14:51', '1/4/5', 2, 2, 0),
(8, 3, 3, 4, '2021-08-02 00:59:07', '2021-09-09 20:39:04', '1/4/8', 3, 2, 0),
(9, 3, 3, 4, '2021-08-02 01:11:12', '2021-09-09 20:39:33', '1/4/9', 1, 2, 1),
(10, 3, 3, 4, '2021-08-02 01:12:29', '2021-09-09 20:39:53', '1/4/10', 4, 2, 0),
(12, 3, 3, 4, '2021-08-16 04:13:35', '2021-10-11 00:35:20', '1/4/12', 5, 2, 0),
(13, 3, 3, 9, '2021-09-09 04:38:10', '2021-09-09 04:38:10', '1/4/9/13', 1, 3, 0),
(14, 3, 3, 4, '2021-09-09 20:45:48', '2021-09-09 20:45:48', '1/4/14', 6, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_datetime`
--

CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_datetime`
--

INSERT INTO `catalog_category_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(6, 3, 61, 0, 2, NULL),
(7, 3, 62, 0, 2, NULL),
(8, 3, 61, 0, 4, NULL),
(9, 3, 62, 0, 4, NULL),
(14, 3, 61, 0, 5, NULL),
(15, 3, 62, 0, 5, NULL),
(26, 3, 61, 0, 8, NULL),
(27, 3, 62, 0, 8, NULL),
(30, 3, 61, 0, 9, NULL),
(31, 3, 62, 0, 9, NULL),
(40, 3, 61, 0, 10, NULL),
(41, 3, 62, 0, 10, NULL),
(85, 3, 61, 0, 12, NULL),
(86, 3, 62, 0, 12, NULL),
(94, 3, 61, 0, 13, NULL),
(95, 3, 62, 0, 13, NULL),
(111, 3, 61, 0, 14, NULL),
(112, 3, 62, 0, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_decimal`
--

CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_decimal`
--

INSERT INTO `catalog_category_entity_decimal` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(2, 3, 72, 0, 2, NULL),
(3, 3, 72, 0, 4, NULL),
(4, 3, 72, 0, 5, NULL),
(7, 3, 72, 0, 8, NULL),
(8, 3, 72, 0, 9, NULL),
(9, 3, 72, 0, 10, NULL),
(11, 3, 72, 0, 12, NULL),
(12, 3, 72, 0, 13, NULL),
(13, 3, 72, 0, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_int`
--

CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 69, 0, 1, 1),
(2, 3, 69, 1, 1, 1),
(3, 3, 44, 0, 2, 1),
(4, 3, 69, 0, 2, 1),
(5, 3, 44, 1, 2, 1),
(6, 3, 69, 1, 2, 1),
(16, 3, 52, 0, 2, NULL),
(17, 3, 53, 0, 2, 0),
(18, 3, 71, 0, 2, 0),
(19, 3, 44, 0, 4, 1),
(20, 3, 69, 0, 4, 1),
(21, 3, 52, 0, 4, NULL),
(22, 3, 53, 0, 4, 0),
(23, 3, 70, 0, 4, 0),
(24, 3, 71, 0, 4, 0),
(27, 3, 44, 0, 5, 1),
(28, 3, 69, 0, 5, 1),
(29, 3, 52, 0, 5, NULL),
(30, 3, 53, 0, 5, 0),
(31, 3, 70, 0, 5, 0),
(32, 3, 71, 0, 5, 0),
(48, 3, 44, 0, 8, 1),
(49, 3, 69, 0, 8, 1),
(50, 3, 52, 0, 8, NULL),
(51, 3, 53, 0, 8, 0),
(52, 3, 70, 0, 8, 0),
(53, 3, 71, 0, 8, 0),
(55, 3, 44, 0, 9, 1),
(56, 3, 69, 0, 9, 1),
(57, 3, 52, 0, 9, 6),
(58, 3, 53, 0, 9, 0),
(59, 3, 70, 0, 9, 0),
(60, 3, 71, 0, 9, 0),
(67, 3, 44, 0, 10, 1),
(68, 3, 69, 0, 10, 1),
(69, 3, 52, 0, 10, NULL),
(70, 3, 53, 0, 10, 0),
(71, 3, 70, 0, 10, 0),
(72, 3, 71, 0, 10, 0),
(98, 3, 44, 0, 12, 1),
(99, 3, 69, 0, 12, 1),
(100, 3, 52, 0, 12, NULL),
(101, 3, 53, 0, 12, 0),
(102, 3, 70, 0, 12, 0),
(103, 3, 71, 0, 12, 1),
(108, 3, 44, 0, 13, 1),
(109, 3, 69, 0, 13, 0),
(110, 3, 52, 0, 13, NULL),
(111, 3, 53, 0, 13, 0),
(112, 3, 70, 0, 13, 0),
(113, 3, 71, 0, 13, 0),
(121, 3, 44, 0, 14, 1),
(122, 3, 69, 0, 14, 1),
(123, 3, 52, 0, 14, NULL),
(124, 3, 53, 0, 14, 0),
(125, 3, 70, 0, 14, 0),
(126, 3, 71, 0, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_text`
--

CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_text`
--

INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 67, 0, 1, NULL),
(2, 3, 67, 1, 1, NULL),
(3, 3, 67, 0, 2, NULL),
(16, 3, 46, 0, 2, NULL),
(17, 3, 49, 0, 2, NULL),
(18, 3, 50, 0, 2, NULL),
(19, 3, 64, 0, 2, NULL),
(21, 3, 46, 0, 4, NULL),
(22, 3, 49, 0, 4, NULL),
(23, 3, 50, 0, 4, NULL),
(24, 3, 64, 0, 4, NULL),
(25, 3, 67, 0, 4, NULL),
(36, 3, 46, 0, 5, NULL),
(37, 3, 49, 0, 5, NULL),
(38, 3, 50, 0, 5, NULL),
(39, 3, 64, 0, 5, NULL),
(40, 3, 67, 0, 5, NULL),
(66, 3, 46, 0, 8, NULL),
(67, 3, 49, 0, 8, NULL),
(68, 3, 50, 0, 8, NULL),
(69, 3, 64, 0, 8, NULL),
(70, 3, 67, 0, 8, NULL),
(76, 3, 46, 0, 9, NULL),
(77, 3, 49, 0, 9, NULL),
(78, 3, 50, 0, 9, NULL),
(79, 3, 64, 0, 9, NULL),
(80, 3, 67, 0, 9, NULL),
(101, 3, 46, 0, 10, NULL),
(102, 3, 49, 0, 10, NULL),
(103, 3, 50, 0, 10, NULL),
(104, 3, 64, 0, 10, NULL),
(105, 3, 67, 0, 10, NULL),
(212, 3, 46, 0, 12, NULL),
(213, 3, 49, 0, 12, NULL),
(214, 3, 50, 0, 12, NULL),
(215, 3, 64, 0, 12, NULL),
(216, 3, 67, 0, 12, NULL),
(233, 3, 46, 0, 13, NULL),
(234, 3, 49, 0, 13, NULL),
(235, 3, 50, 0, 13, NULL),
(236, 3, 64, 0, 13, NULL),
(237, 3, 67, 0, 13, NULL),
(274, 3, 46, 0, 14, NULL),
(275, 3, 49, 0, 14, NULL),
(276, 3, 50, 0, 14, NULL),
(277, 3, 64, 0, 14, NULL),
(278, 3, 67, 0, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_varchar`
--

CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 43, 0, 1, 'Root Catalog'),
(2, 3, 43, 1, 1, 'Root Catalog'),
(3, 3, 45, 1, 1, 'root-catalog'),
(4, 3, 43, 0, 2, 'Default Category'),
(5, 3, 43, 1, 2, 'Default Category'),
(6, 3, 51, 1, 2, 'PRODUCTS'),
(7, 3, 45, 1, 2, 'default-category'),
(17, 3, 48, 0, 2, NULL),
(18, 3, 60, 0, 2, NULL),
(19, 3, 63, 0, 2, NULL),
(20, 3, 43, 0, 4, 'Home'),
(21, 3, 48, 0, 4, NULL),
(22, 3, 51, 0, 4, 'PRODUCTS'),
(23, 3, 60, 0, 4, NULL),
(24, 3, 63, 0, 4, NULL),
(25, 3, 45, 0, 4, 'top-products'),
(33, 3, 43, 0, 5, 'Sandbox'),
(34, 3, 45, 0, 5, 'sandbox'),
(35, 3, 48, 0, 5, NULL),
(36, 3, 51, 0, 5, 'PRODUCTS'),
(37, 3, 60, 0, 5, NULL),
(38, 3, 63, 0, 5, 'one_column'),
(42, 3, 59, 1, 5, 'sandbox'),
(43, 3, 59, 0, 5, 'sandbox'),
(63, 3, 43, 0, 8, 'FPS'),
(64, 3, 45, 0, 8, 'fps'),
(65, 3, 48, 0, 8, NULL),
(66, 3, 51, 0, 8, 'PRODUCTS'),
(67, 3, 60, 0, 8, NULL),
(68, 3, 63, 0, 8, 'one_column'),
(69, 3, 59, 1, 8, 'fps'),
(70, 3, 59, 0, 8, 'fps'),
(74, 3, 47, 0, 8, 'FPS.png'),
(75, 3, 43, 0, 9, 'Featured Game'),
(76, 3, 48, 0, 9, NULL),
(77, 3, 51, 0, 9, 'PRODUCTS'),
(78, 3, 60, 0, 9, NULL),
(79, 3, 63, 0, 9, 'one_column'),
(80, 3, 45, 0, 9, 'featured-game'),
(92, 3, 47, 0, 5, 'Sandbox_1.png'),
(98, 3, 43, 0, 10, 'RPG'),
(99, 3, 45, 0, 10, 'jrpg'),
(100, 3, 48, 0, 10, NULL),
(101, 3, 51, 0, 10, 'PRODUCTS'),
(102, 3, 60, 0, 10, NULL),
(103, 3, 63, 0, 10, 'one_column'),
(104, 3, 47, 0, 10, 'RPG.png'),
(105, 3, 59, 1, 10, 'jrpg'),
(106, 3, 59, 0, 10, 'jrpg'),
(132, 3, 59, 1, 9, 'featured-game'),
(133, 3, 59, 0, 9, 'featured-game'),
(137, 3, 47, 0, 9, 'Featured.png'),
(184, 3, 43, 0, 12, 'Indie'),
(185, 3, 45, 0, 12, 'indie'),
(186, 3, 48, 0, 12, NULL),
(187, 3, 51, 0, 12, 'PRODUCTS'),
(188, 3, 60, 0, 12, NULL),
(189, 3, 63, 0, 12, 'one_column'),
(190, 3, 59, 1, 12, 'indie'),
(191, 3, 59, 0, 12, 'indie'),
(205, 3, 47, 0, 12, 'Indie_1.png'),
(206, 3, 43, 0, 13, 'Sale'),
(207, 3, 45, 0, 13, 'sale'),
(208, 3, 48, 0, 13, NULL),
(209, 3, 51, 0, 13, 'PRODUCTS'),
(210, 3, 60, 0, 13, NULL),
(211, 3, 63, 0, 13, NULL),
(212, 3, 59, 1, 13, 'featured-game/sale'),
(213, 3, 59, 0, 13, 'featured-game/sale'),
(237, 3, 43, 0, 14, 'Racing'),
(238, 3, 45, 0, 14, 'racing'),
(239, 3, 48, 0, 14, NULL),
(240, 3, 51, 0, 14, 'PRODUCTS'),
(241, 3, 60, 0, 14, NULL),
(242, 3, 63, 0, 14, NULL),
(243, 3, 47, 0, 14, 'Racing.png'),
(244, 3, 59, 1, 14, 'racing'),
(245, 3, 59, 0, 14, 'racing');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_flat_store_1`
--

CREATE TABLE `catalog_category_flat_store_1` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'entity_id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'parent_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'path',
  `position` int(11) NOT NULL COMMENT 'position',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT 'level',
  `children_count` int(11) NOT NULL COMMENT 'children_count',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `all_children` text DEFAULT NULL COMMENT 'All Children',
  `available_sort_by` text DEFAULT NULL COMMENT 'Available Product Listing Sort By',
  `children` text DEFAULT NULL COMMENT 'Children',
  `custom_apply_to_products` int(11) DEFAULT NULL COMMENT 'Apply To Products',
  `custom_design` varchar(255) DEFAULT NULL COMMENT 'Custom Design',
  `custom_design_from` datetime DEFAULT NULL COMMENT 'Active From',
  `custom_design_to` datetime DEFAULT NULL COMMENT 'Active To',
  `custom_layout_update` text DEFAULT NULL COMMENT 'Custom Layout Update',
  `custom_use_parent_settings` int(11) DEFAULT NULL COMMENT 'Use Parent Category Settings',
  `default_sort_by` varchar(255) DEFAULT NULL COMMENT 'Default Product Listing Sort By',
  `description` text DEFAULT NULL COMMENT 'Description',
  `display_mode` varchar(255) DEFAULT NULL COMMENT 'Display Mode',
  `filter_price_range` decimal(12,4) DEFAULT NULL COMMENT 'Layered Navigation Price Step',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `include_in_menu` int(11) DEFAULT NULL COMMENT 'Include in Navigation Menu',
  `is_active` int(11) DEFAULT NULL COMMENT 'Is Active',
  `is_anchor` int(11) DEFAULT NULL COMMENT 'Is Anchor',
  `landing_page` int(11) DEFAULT NULL COMMENT 'CMS Block',
  `meta_description` text DEFAULT NULL COMMENT 'Meta Description',
  `meta_keywords` text DEFAULT NULL COMMENT 'Meta Keywords',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `path_in_store` text DEFAULT NULL COMMENT 'Path In Store',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'URL Key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'Url Path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Flat (Store 1)';

--
-- Dumping data for table `catalog_category_flat_store_1`
--

INSERT INTO `catalog_category_flat_store_1` (`entity_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`, `store_id`, `all_children`, `available_sort_by`, `children`, `custom_apply_to_products`, `custom_design`, `custom_design_from`, `custom_design_to`, `custom_layout_update`, `custom_use_parent_settings`, `default_sort_by`, `description`, `display_mode`, `filter_price_range`, `image`, `include_in_menu`, `is_active`, `is_anchor`, `landing_page`, `meta_description`, `meta_keywords`, `meta_title`, `name`, `page_layout`, `path_in_store`, `url_key`, `url_path`) VALUES
(1, 0, '2021-07-26 01:30:03', '2021-07-26 01:30:03', '1', 0, 0, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Root Catalog', NULL, NULL, 'root-catalog', NULL),
(2, 1, '2021-07-26 01:30:04', '2021-07-26 01:30:04', '1/2', 1, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRODUCTS', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 'Default Category', NULL, NULL, 'default-category', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product`
--

CREATE TABLE `catalog_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';

--
-- Dumping data for table `catalog_category_product`
--

INSERT INTO `catalog_category_product` (`category_id`, `product_id`, `position`) VALUES
(4, 7, 1),
(5, 8, 1),
(5, 13, 1),
(8, 9, 1),
(8, 11, 1),
(8, 12, 1),
(9, 7, 1),
(9, 8, 1),
(9, 13, 1),
(10, 7, 1),
(10, 14, 1),
(12, 15, 1),
(13, 13, 1),
(14, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index`
--

CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

--
-- Dumping data for table `catalog_category_product_index`
--

INSERT INTO `catalog_category_product_index` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(4, 8, 20005, 0, 1, 4),
(4, 13, 20005, 0, 1, 4),
(4, 9, 40009, 0, 1, 4),
(4, 11, 40009, 0, 1, 4),
(4, 12, 40009, 0, 1, 4),
(4, 14, 50011, 0, 1, 4),
(4, 15, 60013, 0, 1, 4),
(4, 10, 70014, 0, 1, 4),
(4, 7, 1, 1, 1, 4),
(5, 8, 1, 1, 1, 4),
(5, 13, 1, 1, 1, 4),
(8, 9, 1, 1, 1, 4),
(8, 11, 1, 1, 1, 4),
(8, 12, 1, 1, 1, 4),
(9, 7, 1, 1, 1, 4),
(9, 8, 1, 1, 1, 4),
(9, 13, 1, 1, 1, 4),
(10, 7, 1, 1, 1, 4),
(10, 14, 1, 1, 1, 4),
(12, 15, 1, 1, 1, 4),
(13, 13, 1, 1, 1, 4),
(14, 10, 0, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_enbl_idx`
--

CREATE TABLE `catalog_category_product_index_enbl_idx` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `visibility` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_enbl_tmp`
--

CREATE TABLE `catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `visibility` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Visibility'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_idx`
--

CREATE TABLE `catalog_category_product_index_idx` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_tmp`
--

CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_item`
--

CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Compare Item ID',
  `visitor_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Visitor ID',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_eav_attribute`
--

CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Global',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `is_searchable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Searchable',
  `is_filterable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Filterable',
  `is_comparable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used For Sorting',
  `is_configurable` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Configurable',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used For Promo Rules'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES
(43, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(44, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(46, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0),
(47, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(51, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(52, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(53, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(54, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(57, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(58, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(59, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(62, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(63, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(64, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(65, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(66, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(67, 'adminhtml/catalog_category_helper_sortby_available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(68, 'adminhtml/catalog_category_helper_sortby_default', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(69, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(70, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(71, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(72, 'adminhtml/catalog_category_helper_pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(73, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, NULL, 1, 0, 0, 0),
(74, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 1, 0),
(75, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, NULL, 1, 0, 1, 0),
(76, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 0, 0),
(77, NULL, 2, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0, 0),
(78, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(79, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(80, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(81, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'virtual,downloadable', 0, 0, 0, 0),
(82, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,bundle', 0, 0, 0, 0),
(83, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'simple', 1, 0, 0, 0),
(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(86, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(87, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(88, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(89, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(90, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(91, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(92, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(93, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(94, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'simple', 1, 0, 0, 0),
(95, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(96, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(97, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(98, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(99, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(100, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(101, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(102, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual', 0, 0, 0, 0),
(103, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual', 0, 0, 0, 0),
(104, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(105, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(106, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(107, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(108, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(109, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(110, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(111, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(112, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(113, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(114, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(115, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(116, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(117, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(118, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(119, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,configurable,bundle,grouped', 0, 0, 0, 0),
(120, 'adminhtml/catalog_product_helper_form_msrp_enabled', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0),
(121, 'adminhtml/catalog_product_helper_form_msrp_price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0),
(122, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0),
(123, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,downloadable,bundle', 1, 0, 0, 0),
(124, 'giftmessage/adminhtml_product_helper_form_config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(125, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(126, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0),
(127, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(128, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(129, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(130, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'downloadable', 0, 0, 0, 0),
(131, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0),
(132, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0),
(133, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'downloadable', 0, 0, 0, 0),
(136, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(137, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(138, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(139, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(140, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(142, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(143, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(144, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option`
--

CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Required',
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option_value`
--

CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value Id',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_price_index`
--

CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection`
--

CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) UNSIGNED NOT NULL COMMENT 'Selection Id',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_default` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Default',
  `selection_price_type` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Selection Can Change Qty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) UNSIGNED NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Selection Price Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT 0 COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_enabled_index`
--

CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Visibility Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Has Options',
  `required_options` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';

--
-- Dumping data for table `catalog_product_entity`
--

INSERT INTO `catalog_product_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `type_id`, `sku`, `has_options`, `required_options`, `created_at`, `updated_at`) VALUES
(7, 4, 9, 'downloadable', '12345', 1, 0, '2021-09-09 04:12:44', '2021-09-10 04:19:03'),
(8, 4, 9, 'downloadable', '123', 1, 0, '2021-09-09 04:43:40', '2021-09-09 21:56:00'),
(9, 4, 9, 'downloadable', NULL, 1, 0, '2021-09-09 19:09:27', '2021-09-09 22:16:23'),
(10, 4, 9, 'downloadable', NULL, 0, 0, '2021-09-09 19:28:03', '2021-09-09 19:30:06'),
(11, 4, 9, 'downloadable', NULL, 1, 0, '2021-09-09 19:34:28', '2021-09-09 19:37:48'),
(12, 4, 9, 'downloadable', NULL, 1, 1, '2021-09-09 19:42:20', '2021-09-09 19:42:20'),
(13, 4, 9, 'downloadable', NULL, 1, 1, '2021-09-09 21:42:30', '2021-09-09 22:56:47'),
(14, 4, 9, 'downloadable', NULL, 1, 1, '2021-09-09 22:02:56', '2021-09-09 23:01:20'),
(15, 4, 9, 'downloadable', NULL, 0, 0, '2021-09-09 22:06:48', '2021-10-11 00:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_datetime`
--

CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';

--
-- Dumping data for table `catalog_product_entity_datetime`
--

INSERT INTO `catalog_product_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(306, 4, 95, 0, 7, NULL),
(307, 4, 96, 0, 7, NULL),
(308, 4, 79, 0, 7, NULL),
(309, 4, 80, 0, 7, NULL),
(310, 4, 106, 0, 7, NULL),
(311, 4, 107, 0, 7, NULL),
(360, 4, 95, 0, 8, NULL),
(361, 4, 96, 0, 8, NULL),
(362, 4, 79, 0, 8, NULL),
(363, 4, 80, 0, 8, NULL),
(364, 4, 106, 0, 8, NULL),
(365, 4, 107, 0, 8, NULL),
(403, 4, 95, 0, 9, NULL),
(404, 4, 96, 0, 9, NULL),
(405, 4, 79, 0, 9, '2021-09-10 00:00:00'),
(406, 4, 80, 0, 9, NULL),
(407, 4, 106, 0, 9, NULL),
(408, 4, 107, 0, 9, NULL),
(446, 4, 95, 0, 10, NULL),
(447, 4, 96, 0, 10, NULL),
(448, 4, 79, 0, 10, NULL),
(449, 4, 80, 0, 10, NULL),
(450, 4, 106, 0, 10, NULL),
(451, 4, 107, 0, 10, NULL),
(476, 4, 95, 0, 11, NULL),
(477, 4, 96, 0, 11, NULL),
(478, 4, 79, 0, 11, NULL),
(479, 4, 80, 0, 11, NULL),
(480, 4, 106, 0, 11, NULL),
(481, 4, 107, 0, 11, NULL),
(494, 4, 95, 0, 12, NULL),
(495, 4, 96, 0, 12, NULL),
(496, 4, 79, 0, 12, NULL),
(497, 4, 80, 0, 12, NULL),
(498, 4, 106, 0, 12, NULL),
(499, 4, 107, 0, 12, NULL),
(506, 4, 95, 0, 13, NULL),
(507, 4, 96, 0, 13, NULL),
(508, 4, 79, 0, 13, NULL),
(509, 4, 80, 0, 13, NULL),
(510, 4, 106, 0, 13, NULL),
(511, 4, 107, 0, 13, NULL),
(560, 4, 95, 0, 14, NULL),
(561, 4, 96, 0, 14, NULL),
(562, 4, 79, 0, 14, NULL),
(563, 4, 80, 0, 14, NULL),
(564, 4, 106, 0, 14, NULL),
(565, 4, 107, 0, 14, NULL),
(566, 4, 95, 0, 15, NULL),
(567, 4, 96, 0, 15, NULL),
(568, 4, 79, 0, 15, NULL),
(569, 4, 80, 0, 15, NULL),
(570, 4, 106, 0, 15, NULL),
(571, 4, 107, 0, 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_decimal`
--

CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';

--
-- Dumping data for table `catalog_product_entity_decimal`
--

INSERT INTO `catalog_product_entity_decimal` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(181, 4, 77, 0, 7, '1584.0000'),
(182, 4, 78, 0, 7, NULL),
(183, 4, 81, 0, 7, NULL),
(184, 4, 122, 0, 7, NULL),
(217, 4, 77, 0, 8, '1340.0000'),
(218, 4, 78, 0, 8, NULL),
(219, 4, 81, 0, 8, NULL),
(220, 4, 122, 0, 8, NULL),
(250, 4, 77, 0, 9, '2560.0000'),
(251, 4, 78, 0, 9, '1580.0000'),
(252, 4, 81, 0, 9, NULL),
(253, 4, 122, 0, 9, NULL),
(279, 4, 77, 0, 10, '3648.0000'),
(280, 4, 78, 0, 10, NULL),
(281, 4, 81, 0, 10, NULL),
(282, 4, 122, 0, 10, NULL),
(299, 4, 77, 0, 11, '2599.0000'),
(300, 4, 78, 0, 11, NULL),
(301, 4, 81, 0, 11, NULL),
(302, 4, 122, 0, 11, NULL),
(311, 4, 77, 0, 12, '3025.0000'),
(312, 4, 78, 0, 12, NULL),
(313, 4, 81, 0, 12, NULL),
(314, 4, 122, 0, 12, NULL),
(319, 4, 77, 0, 13, '749.0000'),
(320, 4, 78, 0, 13, NULL),
(321, 4, 81, 0, 13, NULL),
(322, 4, 122, 0, 13, NULL),
(355, 4, 77, 0, 14, '1850.0000'),
(356, 4, 78, 0, 14, NULL),
(357, 4, 81, 0, 14, NULL),
(358, 4, 122, 0, 14, NULL),
(359, 4, 77, 0, 15, '899.9900'),
(360, 4, 78, 0, 15, NULL),
(361, 4, 81, 0, 15, NULL),
(362, 4, 122, 0, 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_gallery`
--

CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_group_price`
--

CREATE TABLE `catalog_product_entity_group_price` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `all_groups` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `is_percent` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_int`
--

CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';

--
-- Dumping data for table `catalog_product_entity_int`
--

INSERT INTO `catalog_product_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(25, 4, 98, 0, 7, 1),
(26, 4, 104, 0, 7, 4),
(27, 4, 123, 0, 7, 0),
(28, 4, 130, 0, 7, 0),
(29, 4, 133, 0, 7, 1),
(33, 4, 98, 0, 8, 1),
(34, 4, 104, 0, 8, 4),
(35, 4, 123, 0, 8, 0),
(36, 4, 130, 0, 8, 0),
(37, 4, 133, 0, 8, 1),
(41, 4, 98, 0, 9, 1),
(42, 4, 104, 0, 9, 4),
(43, 4, 123, 0, 9, 0),
(44, 4, 130, 0, 9, 0),
(45, 4, 133, 0, 9, 1),
(50, 4, 98, 0, 10, 1),
(51, 4, 104, 0, 10, 4),
(52, 4, 123, 0, 10, 0),
(53, 4, 130, 0, 10, 1),
(54, 4, 98, 0, 11, 1),
(55, 4, 104, 0, 11, 4),
(56, 4, 123, 0, 11, 0),
(57, 4, 130, 0, 11, 0),
(58, 4, 133, 0, 11, 1),
(61, 4, 98, 0, 12, 1),
(62, 4, 104, 0, 12, 4),
(63, 4, 123, 0, 12, 0),
(64, 4, 130, 0, 12, 1),
(65, 4, 133, 0, 12, 1),
(67, 4, 98, 0, 13, 1),
(68, 4, 104, 0, 13, 4),
(69, 4, 123, 0, 13, 0),
(70, 4, 130, 0, 13, 0),
(71, 4, 133, 0, 13, 1),
(80, 4, 98, 0, 14, 1),
(81, 4, 104, 0, 14, 4),
(82, 4, 123, 0, 14, 0),
(83, 4, 130, 0, 14, 0),
(84, 4, 133, 0, 14, 1),
(85, 4, 98, 0, 15, 1),
(86, 4, 104, 0, 15, 4),
(87, 4, 123, 0, 15, 0),
(88, 4, 130, 0, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

INSERT INTO `catalog_product_entity_media_gallery` (`value_id`, `attribute_id`, `entity_id`, `value`) VALUES
(11, 90, 7, '/3/0/300px-days_gone_cover_jpg_1.jpg'),
(12, 90, 8, '/m/i/minecraft-xbox-one_jpg_2.jpg'),
(17, 90, 9, '/2/2/220px-cover_art_of_doom_eternal.png'),
(18, 90, 10, '/2/2/220px-forza_horizon_4_cover.jpg'),
(19, 90, 11, '/4/8/485182-deus-ex-mankind-divided-playstation-4-front-cover.jpg'),
(20, 90, 11, '/g/a/gamepage_header_portrait_03.jpg'),
(21, 90, 12, '/c/a/call_of_duty_wwii_cover_art.jpg'),
(22, 90, 13, '/6/4/641190-state-of-decay-2-juggernaut-edition-windows-apps-front-cover.jpg'),
(23, 90, 14, '/g/h/ghost_recon_wildlands_cover_art.jpg'),
(24, 90, 15, '/l/i/little_nightmares_cover_art.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Value ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Disabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

INSERT INTO `catalog_product_entity_media_gallery_value` (`value_id`, `store_id`, `label`, `position`, `disabled`) VALUES
(11, 0, NULL, 0, 1),
(12, 0, NULL, 1, 0),
(17, 0, NULL, 1, 1),
(18, 0, NULL, 1, 1),
(19, 0, NULL, 1, 1),
(20, 0, NULL, 2, 1),
(21, 0, NULL, 1, 1),
(22, 0, NULL, 1, 1),
(23, 0, NULL, 1, 1),
(24, 0, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_text`
--

CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` text DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';

--
-- Dumping data for table `catalog_product_entity_text`
--

INSERT INTO `catalog_product_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(138, 4, 74, 0, 7, 'Set in a post-apocalyptic Oregon two years after the start of a global pandemic, former outlaw-turned-drifter Deacon St. John discovers the possibility of his wife Sarah still being alive, which leads Deacon on a quest to find her. Days Gone is played from a third-person perspective, in which the player can explore an open world environment. Players can use firearms, melee weapons and improvised weapons, and can use stealth to defend against hostile humans and cannibalistic creatures known as Freakers. A major game mechanic is Deacon\'s motorcycle, which is used as the player character\'s primary mode of transportation as well as mobile inventory. '),
(139, 4, 75, 0, 7, NULL),
(140, 4, 85, 0, 7, NULL),
(141, 4, 108, 0, 7, NULL),
(166, 4, 74, 0, 8, '<p>Create anything you can imagine. Explore randomly generated worlds. Survive dangerous mobs at night. This collection includes the Minecraft base game and the Starter Pack compilation:</p>\r\n<ul>\r\n<li>Greek Mythology Mash-up</li>\r\n<li>Plastic Texture Pack</li>\r\n<li>Skin Pack 1</li>\r\n<li>Villains Skin Pack</li>\r\n</ul>\r\n<p>Also get 700 Minecoins to use in the in-game Marketplace!</p>'),
(167, 4, 75, 0, 8, NULL),
(168, 4, 85, 0, 8, NULL),
(169, 4, 108, 0, 8, NULL),
(192, 4, 74, 0, 9, 'Hell\'s armies have invaded Earth. Become the Slayer in an epic single-player campaign to conquer demons across dimensions and stop the final destruction of humanity. The only thing they fear... is you. Experience the ultimate combination of speed and power in DOOM Eternal - the next leap in push-forward, first-person combat. Discover the Slayer???s origins and his enduring mission to RAZE HELL'),
(193, 4, 75, 0, 9, NULL),
(194, 4, 85, 0, 9, NULL),
(195, 4, 108, 0, 9, NULL),
(215, 4, 74, 0, 10, 'Live the Horizon Life when you play Forza Horizon 4. Experience a shared world with dynamic seasons. Explore beautiful scenery, collect over 450 cars and become a Horizon Superstar in historic Britain. '),
(216, 4, 75, 0, 10, NULL),
(217, 4, 85, 0, 10, NULL),
(218, 4, 108, 0, 10, NULL),
(231, 4, 74, 0, 11, 'The year is 2029, and mechanically augmented humans have now been deemed outcasts, living a life of complete and total segregation from the rest of society.\r\n\r\nNow an experienced covert operative, Adam Jensen is forced to operate in a world that has grown to despise his kind. Armed with a new arsenal of state-of-the-art weapons and augmentations, he must choose the right approach, along with who to trust, in order to unravel a vast worldwide conspiracy.'),
(232, 4, 75, 0, 11, NULL),
(233, 4, 85, 0, 11, NULL),
(234, 4, 108, 0, 11, NULL),
(241, 4, 74, 0, 12, 'Call of Duty: WWII is a 2017 first-person shooter video game developed by Sledgehammer Games and published by Activision. It was released worldwide on November 3, 2017 for Microsoft Windows, PlayStation 4 and Xbox One. It is the fourteenth main installment in the Call of Duty series and the first title in the series to be set primarily during World War II since Call of Duty: World at War in 2008.\r\n\r\nThe game\'s campaign is set in the European theatre and is centered around a squad in the 1st Infantry Division following their battles on the Western Front and set mainly in the historical events of Operation Overlord. The player controls Ronald \"Red\" Daniels, who has squadmates who can supply the player with extra ammunition, health, or grenades as well as a targeted grenade and target spotting; none of these are automatically replenished in the campaign. The multiplayer mode features map locations not seen in the campaign. The mode also features the new Divisions system, replacing the create-a-class system that previous games in the series used. A social hub, Headquarters, was also implemented into the game, allowing for players to interact with each other. '),
(242, 4, 75, 0, 12, NULL),
(243, 4, 85, 0, 12, NULL),
(244, 4, 108, 0, 12, NULL),
(248, 4, 74, 0, 13, 'In State of Decay 2, the quiet stillness of the post-apocalyptic world is interrupted by gruesome horror and grisly violence. If you can\'t defend yourself with the guns, knives, and bats you find while scavenging, you might see your character literally ripped apart by monstrous zombies... or murdered by aggressive NPCs looking to claim your territory!\r\n<br><br>\r\nState of Decay 2: Juggernaut Edition re-imagines the popular survival game as a brand-new experience to welcome first-time players... and those who\'ve come back from the dead. Available on Steam for the first time, this edition is packed with new and remastered content for the ultimate zombie survival experience.\r\n<br><br>\r\nJoin over 10 million existing players and discover what Juggernaut Edition has to offer:\r\n<br><br>\r\n    The base game plus all three add-on packs released to date, including the all-new Homecoming update:<br>\r\n    ??? Homecoming: a full-size, fully remastered, open world version of Trumbull Valley for the core game, reintegrating the Mount Tanner and Fairfield regions to the map, and adding new sites to scavenge, along with new sights to behold.<br>\r\n    ??? Heartland: an massive story campaign set in a familiar town with new challenges<br>\r\n    ??? Daybreak Pack: a test of teamwork with siege-style, \"survive the horde\" gameplay<br>\r\n    ??? Independence Pack: a celebration of history that blows up zombies... with fireworks!\r\n<br><br>\r\n    ???  Remastered graphics and an upgraded engine featuring realistic fog effects<br>\r\n    ??? An expanded soundtrack with hours of new thematic musical arrangements<br>\r\n    ??? Providence Ridge: a brand-new open-world map full of forests, zombies, and mystery<br>\r\n    ??? Two-handed heavy weapons with new melee combat moves to bust zombie heads<br>\r\n    ??? A new introductory experience and improved controls to help you master the apocalypse\r\n<br><br>\r\n... and countless other improvements to the classic open-ended sandbox gameplay.'),
(249, 4, 75, 0, 13, NULL),
(250, 4, 85, 0, 13, NULL),
(251, 4, 108, 0, 13, NULL),
(278, 4, 74, 0, 14, 'Create a team with up to 3 friends in Tom Clancy???s Ghost Recon?? Wildlands and enjoy the ultimate military shooter experience set in a massive, dangerous, and responsive open world. You can also play PVP in 4v4 class-based, tactical fights: Ghost War.<br><br>\r\n\r\nTAKE DOWN THE CARTEL<br>\r\nIn a near future, Bolivia has fallen into the hands of Santa Blanca, a merciless drug cartel who spread injustice and violence. Their objective: to create the biggest Narco-State in history.<br><br>\r\n\r\nBECOME A GHOST<br>\r\nCreate and fully customize your Ghost, weapons, and gear. Enjoy a total freedom of playstyle. Lead your team and take down the cartel, either solo or with up to three friends.<br><br>\r\n\r\nEXPLORE BOLIVIA<br>\r\nJourney through Ubisoft\'s largest action-adventure open world. Discover the stunning diverse landscapes of the Wildlands both on and off road, in the air, on land, and at sea with over 60 different vehicles.<br><br>\r\n\r\nTRUST YOUR EYES<br>\r\nTaking out the Santa Blanca Cartel becomes an even richer experience with Tobii Eye Tracking. Features like Extended View, Aim at Gaze and Communications Wheel let you use your natural eye movement to interact with the environment ??? without interrupting or modifying your traditional controls. Now armed with an extensive eye tracking feature set, team communication becomes more seamless, firefights become more intense and exploring your new surroundings becomes an even more immersive adventure.<br><br>\r\n\r\nCompatible with all Tobii Eye Tracking gaming devices.<br>\r\n----<br>\r\nAdditional notes:<br>\r\nEye tracking features available with Tobii Eye Tracking. '),
(279, 4, 75, 0, 14, NULL),
(280, 4, 85, 0, 14, NULL),
(281, 4, 108, 0, 14, NULL),
(282, 4, 74, 0, 15, 'Little Nightmares II is a suspense-adventure game in which you play as Mono, a young boy trapped in a world that has been distorted by the humming transmission of a distant tower.<br><br>\r\n\r\nWith Six, the girl in a yellow raincoat, as his guide, Mono sets out to discover the dark secrets of The Signal Tower and save Six from her terrible fate.<br><br>\r\n\r\nBut their journey will not be straightforward as Mono and Six will face a gallery of new threats from the terrible residents of this world.<br><br>\r\n\r\nWill you dare to face this collection of new, little nightmares?'),
(283, 4, 75, 0, 15, NULL),
(284, 4, 85, 0, 15, NULL),
(285, 4, 108, 0, 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_tier_price`
--

CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `all_groups` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT 1.0000 COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_varchar`
--

CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';

--
-- Dumping data for table `catalog_product_entity_varchar`
--

INSERT INTO `catalog_product_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(526, 4, 73, 0, 7, 'Days Gone'),
(527, 4, 99, 0, 7, 'days-gone'),
(528, 4, 136, 0, 7, 'Intel Core i5-2500K / AMD FX 6300'),
(529, 4, 137, 0, 7, '8 GB'),
(530, 4, 139, 0, 7, 'Nvidia GeForce GTX 780 (3 GB) / AMD Radeon R9 290 (4 GB)'),
(531, 4, 138, 0, 7, '70 GB'),
(532, 4, 140, 0, 7, 'Intel Core i7-4770K / Ryzen 5 1500X'),
(533, 4, 144, 0, 7, '16 GB'),
(534, 4, 143, 0, 7, 'Nvidia GeForce GTX 1060 (6 GB) / AMD Radeon RX 580 (8 GB)'),
(535, 4, 142, 0, 7, '70 GB'),
(536, 4, 120, 0, 7, '2'),
(537, 4, 121, 0, 7, '4'),
(538, 4, 87, 0, 7, '/3/0/300px-days_gone_cover_jpg_1.jpg'),
(539, 4, 88, 0, 7, '/3/0/300px-days_gone_cover_jpg_1.jpg'),
(540, 4, 89, 0, 7, '/3/0/300px-days_gone_cover_jpg_1.jpg'),
(541, 4, 84, 0, 7, NULL),
(542, 4, 86, 0, 7, NULL),
(543, 4, 105, 0, 7, NULL),
(544, 4, 109, 0, 7, NULL),
(545, 4, 111, 0, 7, 'container1'),
(546, 4, 131, 0, 7, 'Samples'),
(547, 4, 132, 0, 7, 'Links'),
(548, 4, 124, 0, 7, NULL),
(549, 4, 100, 1, 7, 'days-gone'),
(550, 4, 100, 0, 7, 'days-gone'),
(570, 4, 114, 0, 7, NULL),
(571, 4, 115, 0, 7, NULL),
(572, 4, 116, 0, 7, NULL),
(613, 4, 73, 0, 8, 'Minecraft Bedrock'),
(614, 4, 99, 0, 8, 'minecraft-bedrock'),
(615, 4, 136, 0, 8, 'Intel Celeron J4105 | AMD FX-4100'),
(616, 4, 137, 0, 8, '4 GB'),
(617, 4, 139, 0, 8, 'Intel HD Graphics 4000 | AMD Radeon R5'),
(618, 4, 138, 0, 8, NULL),
(619, 4, 140, 0, 8, 'Intel i7-6500U | AMD A8-6600K'),
(620, 4, 144, 0, 8, '8 GB'),
(621, 4, 143, 0, 8, 'NVIDIA GeForce 940M | AMD Radeon HD 8570D'),
(622, 4, 142, 0, 8, NULL),
(623, 4, 120, 0, 8, '2'),
(624, 4, 121, 0, 8, '4'),
(625, 4, 87, 0, 8, '/m/i/minecraft-xbox-one_jpg_2.jpg'),
(626, 4, 88, 0, 8, '/m/i/minecraft-xbox-one_jpg_2.jpg'),
(627, 4, 89, 0, 8, '/m/i/minecraft-xbox-one_jpg_2.jpg'),
(628, 4, 84, 0, 8, NULL),
(629, 4, 86, 0, 8, NULL),
(630, 4, 105, 0, 8, NULL),
(631, 4, 109, 0, 8, NULL),
(632, 4, 111, 0, 8, 'container1'),
(633, 4, 131, 0, 8, 'Samples'),
(634, 4, 132, 0, 8, 'Links'),
(635, 4, 124, 0, 8, NULL),
(636, 4, 100, 1, 8, 'minecraft-bedrock'),
(637, 4, 100, 0, 8, 'minecraft-bedrock'),
(668, 4, 114, 0, 8, NULL),
(669, 4, 115, 0, 8, NULL),
(670, 4, 116, 0, 8, NULL),
(710, 4, 73, 0, 9, 'DOOM Eternal'),
(711, 4, 99, 0, 9, 'doom-eternal'),
(712, 4, 136, 0, 9, 'Intel Core i5 @ 3.3 GHz or better, or AMD Ryzen 3 @ 3.1 GHz or better'),
(713, 4, 137, 0, 9, '8GB'),
(714, 4, 139, 0, 9, 'NVIDIA GeForce 1050Ti (4GB), GTX 1060 (3GB), GTX 1650 (4GB) or AMD Radeon R9 280 (3GB), AMD Radeon R9 290 (4GB) or RX 470 (4GB)'),
(715, 4, 138, 0, 9, '50 GB'),
(716, 4, 140, 0, 9, 'Intel Core i7-6700K or better, or AMD Ryzen 7 1800X or better'),
(717, 4, 144, 0, 9, '8 GB'),
(718, 4, 143, 0, 9, 'NVIDIA GeForce GTX 1080 (8GB), RTX 2060 (6GB) or AMD Radeon RX Vega56 (8GB)'),
(719, 4, 142, 0, 9, '50 GB'),
(720, 4, 120, 0, 9, '2'),
(721, 4, 121, 0, 9, '4'),
(722, 4, 87, 0, 9, '/2/2/220px-cover_art_of_doom_eternal.png'),
(723, 4, 88, 0, 9, '/2/2/220px-cover_art_of_doom_eternal.png'),
(724, 4, 89, 0, 9, '/2/2/220px-cover_art_of_doom_eternal.png'),
(725, 4, 84, 0, 9, NULL),
(726, 4, 86, 0, 9, NULL),
(727, 4, 105, 0, 9, NULL),
(728, 4, 109, 0, 9, NULL),
(729, 4, 111, 0, 9, 'container1'),
(730, 4, 131, 0, 9, 'Samples'),
(731, 4, 132, 0, 9, 'Links'),
(732, 4, 124, 0, 9, NULL),
(733, 4, 100, 1, 9, 'doom-eternal'),
(734, 4, 100, 0, 9, 'doom-eternal'),
(773, 4, 114, 0, 9, NULL),
(774, 4, 115, 0, 9, NULL),
(775, 4, 116, 0, 9, NULL),
(784, 4, 73, 0, 10, 'Forza Horizon 4'),
(785, 4, 99, 0, 10, 'forza-horizon-4'),
(786, 4, 136, 0, 10, 'Intel i3-4170 @ 3.7Ghz OR Intel i5 750 @ 2.67Ghz'),
(787, 4, 137, 0, 10, '8 GB'),
(788, 4, 139, 0, 10, 'NVidia 650TI OR AMD R7 250x'),
(789, 4, 138, 0, 10, NULL),
(790, 4, 140, 0, 10, 'Intel i7-3820 @ 3.6Ghz'),
(791, 4, 144, 0, 10, '12 GB'),
(792, 4, 143, 0, 10, 'NVidia GTX 970 OR NVidia GTX 1060 3GB OR AMD R9 290x OR AMD RX 470'),
(793, 4, 142, 0, 10, NULL),
(794, 4, 120, 0, 10, '2'),
(795, 4, 121, 0, 10, '4'),
(796, 4, 87, 0, 10, '/2/2/220px-forza_horizon_4_cover.jpg'),
(797, 4, 88, 0, 10, '/2/2/220px-forza_horizon_4_cover.jpg'),
(798, 4, 89, 0, 10, '/2/2/220px-forza_horizon_4_cover.jpg'),
(799, 4, 84, 0, 10, NULL),
(800, 4, 86, 0, 10, NULL),
(801, 4, 105, 0, 10, NULL),
(802, 4, 109, 0, 10, NULL),
(803, 4, 111, 0, 10, 'container1'),
(804, 4, 131, 0, 10, 'Samples'),
(805, 4, 132, 0, 10, 'Links'),
(806, 4, 124, 0, 10, NULL),
(807, 4, 100, 1, 10, 'forza-horizon-4'),
(808, 4, 100, 0, 10, 'forza-horizon-4'),
(832, 4, 114, 0, 10, NULL),
(833, 4, 115, 0, 10, NULL),
(834, 4, 116, 0, 10, NULL),
(855, 4, 73, 0, 11, 'Deus EX Mankind Divided'),
(856, 4, 99, 0, 11, 'deus-ex-mankind-divided'),
(857, 4, 136, 0, 11, 'Intel Core i3-2100 or AMD equivalent'),
(858, 4, 137, 0, 11, '8 GB '),
(859, 4, 139, 0, 11, 'AMD Radeon HD 7870 (2GB) or NVIDIA GeForce GTX 660 (2GB)'),
(860, 4, 138, 0, 11, '45 GB'),
(861, 4, 140, 0, 11, 'Intel Core i7-3770K or AMD FX 8350 Wraith'),
(862, 4, 144, 0, 11, '16 GB'),
(863, 4, 143, 0, 11, 'AMD Radeon RX 480  or NVIDIA GTX 970 - 1080p'),
(864, 4, 142, 0, 11, '55 GB includes DLC'),
(865, 4, 120, 0, 11, '2'),
(866, 4, 121, 0, 11, '4'),
(867, 4, 87, 0, 11, '/4/8/485182-deus-ex-mankind-divided-playstation-4-front-cover.jpg'),
(868, 4, 88, 0, 11, '/g/a/gamepage_header_portrait_03.jpg'),
(869, 4, 89, 0, 11, '/g/a/gamepage_header_portrait_03.jpg'),
(870, 4, 84, 0, 11, NULL),
(871, 4, 86, 0, 11, NULL),
(872, 4, 105, 0, 11, NULL),
(873, 4, 109, 0, 11, NULL),
(874, 4, 111, 0, 11, 'container1'),
(875, 4, 131, 0, 11, 'Samples'),
(876, 4, 132, 0, 11, 'Links'),
(877, 4, 124, 0, 11, NULL),
(878, 4, 114, 0, 11, NULL),
(879, 4, 115, 0, 11, NULL),
(880, 4, 116, 0, 11, NULL),
(881, 4, 100, 1, 11, 'deus-ex-mankind-divided'),
(882, 4, 100, 0, 11, 'deus-ex-mankind-divided'),
(901, 4, 73, 0, 12, 'Call of Duty World War II'),
(902, 4, 99, 0, 12, 'call-of-duty-world-war-ii'),
(903, 4, 136, 0, 12, 'Intel?? Core??? i3 3225 or equivalent'),
(904, 4, 137, 0, 12, '8 GB'),
(905, 4, 139, 0, 12, 'NVIDIA?? GeForce?? GTX 660 @ 2 GB / GTX 1050 or AMD Radeon??? HD 7850 @ 2GB'),
(906, 4, 138, 0, 12, '25 GB'),
(907, 4, 140, 0, 12, 'Intel?? Core??? i5-2400 / AMD Ryzen R5 1600X'),
(908, 4, 144, 0, 12, '12 GB'),
(909, 4, 143, 0, 12, 'NVIDIA?? GeForce?? GTX 970 / GTX 1060 @ 6GB or AMD Radeon??? R9 390 / AMD RX 580'),
(910, 4, 142, 0, 12, '25 GB'),
(911, 4, 120, 0, 12, '2'),
(912, 4, 121, 0, 12, '4'),
(913, 4, 87, 0, 12, '/c/a/call_of_duty_wwii_cover_art.jpg'),
(914, 4, 88, 0, 12, '/c/a/call_of_duty_wwii_cover_art.jpg'),
(915, 4, 89, 0, 12, '/c/a/call_of_duty_wwii_cover_art.jpg'),
(916, 4, 84, 0, 12, NULL),
(917, 4, 86, 0, 12, NULL),
(918, 4, 105, 0, 12, NULL),
(919, 4, 109, 0, 12, NULL),
(920, 4, 111, 0, 12, 'container1'),
(921, 4, 131, 0, 12, 'Samples'),
(922, 4, 132, 0, 12, 'Links'),
(923, 4, 124, 0, 12, NULL),
(924, 4, 114, 0, 12, NULL),
(925, 4, 115, 0, 12, NULL),
(926, 4, 116, 0, 12, NULL),
(927, 4, 100, 1, 12, 'call-of-duty-world-war-ii'),
(928, 4, 100, 0, 12, 'call-of-duty-world-war-ii'),
(937, 4, 73, 0, 13, 'State of Decay 2 Juggernaut Edition'),
(938, 4, 99, 0, 13, 'state-of-decay-2-juggernaut-edition'),
(939, 4, 136, 0, 13, 'Intel i5-2500 @2.7Ghz / AMD FX-6300'),
(940, 4, 137, 0, 13, '8 GB RAM'),
(941, 4, 139, 0, 13, 'NVIDIA GeForce GTX 760 2GB / AMD Radeon HD 7870'),
(942, 4, 138, 0, 13, '30 GB available space'),
(943, 4, 140, 0, 13, 'Intel i5 4570 @ 3.2Ghz / AMD FX-8350'),
(944, 4, 144, 0, 13, '16 GB RAM'),
(945, 4, 143, 0, 13, 'NVIDIA GeForce GTX 1650 4GB / AMD Radeon R9 380'),
(946, 4, 142, 0, 13, '30 GB available space'),
(947, 4, 120, 0, 13, '2'),
(948, 4, 121, 0, 13, '4'),
(949, 4, 87, 0, 13, '/6/4/641190-state-of-decay-2-juggernaut-edition-windows-apps-front-cover.jpg'),
(950, 4, 88, 0, 13, '/6/4/641190-state-of-decay-2-juggernaut-edition-windows-apps-front-cover.jpg'),
(951, 4, 89, 0, 13, '/6/4/641190-state-of-decay-2-juggernaut-edition-windows-apps-front-cover.jpg'),
(952, 4, 84, 0, 13, NULL),
(953, 4, 86, 0, 13, NULL),
(954, 4, 105, 0, 13, NULL),
(955, 4, 109, 0, 13, NULL),
(956, 4, 111, 0, 13, 'container1'),
(957, 4, 131, 0, 13, 'Samples'),
(958, 4, 132, 0, 13, 'Links'),
(959, 4, 124, 0, 13, NULL),
(960, 4, 114, 0, 13, NULL),
(961, 4, 115, 0, 13, NULL),
(962, 4, 116, 0, 13, NULL),
(963, 4, 100, 1, 13, 'state-of-decay-2-juggernaut-edition'),
(964, 4, 100, 0, 13, 'state-of-decay-2-juggernaut-edition'),
(1037, 4, 73, 0, 14, 'Tom Clancy\'s Ghost Recon Wildlands'),
(1038, 4, 99, 0, 14, 'tom-clancy-s-ghost-recon-wildlands'),
(1039, 4, 136, 0, 14, 'Intel Core i5-2400S @ 2.5 GHz or AMD FX-4320 @ 4 GHz or equivalent'),
(1040, 4, 137, 0, 14, '6 GB RAM'),
(1041, 4, 139, 0, 14, 'NVIDIA GeForce GTX660 / AMD R9 270X (2GB VRAM with Shader Model 5.0 or better)'),
(1042, 4, 138, 0, 14, '50 GB available space'),
(1043, 4, 140, 0, 14, 'Intel Core i7- 3770@ 3.5 GHz or AMD FX-8350 @ 4 GHz or better'),
(1044, 4, 144, 0, 14, '8 GB RAM'),
(1045, 4, 143, 0, 14, 'NVIDIA GeForce GTX970/GTX 1060 or AMD R9 390/RX480 (4GB VRAM with Shader Model 5.0 or better)'),
(1046, 4, 142, 0, 14, '50 GB available space'),
(1047, 4, 120, 0, 14, '2'),
(1048, 4, 121, 0, 14, '4'),
(1049, 4, 87, 0, 14, '/g/h/ghost_recon_wildlands_cover_art.jpg'),
(1050, 4, 88, 0, 14, '/g/h/ghost_recon_wildlands_cover_art.jpg'),
(1051, 4, 89, 0, 14, '/g/h/ghost_recon_wildlands_cover_art.jpg'),
(1052, 4, 84, 0, 14, NULL),
(1053, 4, 86, 0, 14, NULL),
(1054, 4, 105, 0, 14, NULL),
(1055, 4, 109, 0, 14, NULL),
(1056, 4, 111, 0, 14, 'container1'),
(1057, 4, 131, 0, 14, 'Samples'),
(1058, 4, 132, 0, 14, 'Links'),
(1059, 4, 124, 0, 14, NULL),
(1060, 4, 114, 0, 14, NULL),
(1061, 4, 115, 0, 14, NULL),
(1062, 4, 116, 0, 14, NULL),
(1063, 4, 100, 1, 14, 'tom-clancy-s-ghost-recon-wildlands'),
(1064, 4, 100, 0, 14, 'tom-clancy-s-ghost-recon-wildlands'),
(1065, 4, 73, 0, 15, 'Little Nightmares 2'),
(1066, 4, 99, 0, 15, 'little-nightmares-2'),
(1067, 4, 136, 0, 15, 'Intel Core i5-2300 | AMD FX-4350'),
(1068, 4, 137, 0, 15, '4 GB RAM'),
(1069, 4, 139, 0, 15, 'Nvidia GeForce GTX 570, 1 GB | AMD Radeon HD 7850, 2 GB'),
(1070, 4, 138, 0, 15, NULL),
(1071, 4, 140, 0, 15, 'Intel Core i7-3770 | AMD FX-8350'),
(1072, 4, 144, 0, 15, '4 GB RAM'),
(1073, 4, 143, 0, 15, 'Nvidia GeForce GTX 760, 2 GB | AMD Radeon HD 7870, 2 GB'),
(1074, 4, 142, 0, 15, NULL),
(1075, 4, 120, 0, 15, '2'),
(1076, 4, 121, 0, 15, '4'),
(1077, 4, 87, 0, 15, '/l/i/little_nightmares_cover_art.jpg'),
(1078, 4, 88, 0, 15, '/l/i/little_nightmares_cover_art.jpg'),
(1079, 4, 89, 0, 15, '/l/i/little_nightmares_cover_art.jpg'),
(1080, 4, 84, 0, 15, NULL),
(1081, 4, 86, 0, 15, NULL),
(1082, 4, 105, 0, 15, NULL),
(1083, 4, 109, 0, 15, NULL),
(1084, 4, 111, 0, 15, 'container1'),
(1085, 4, 131, 0, 15, 'Samples'),
(1086, 4, 132, 0, 15, 'Links'),
(1087, 4, 124, 0, 15, NULL),
(1088, 4, 114, 0, 15, NULL),
(1089, 4, 115, 0, 15, NULL),
(1090, 4, 116, 0, 15, NULL),
(1091, 4, 100, 1, 15, 'little-nightmares-2'),
(1092, 4, 100, 0, 15, 'little-nightmares-2');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_flat_1`
--

CREATE TABLE `catalog_product_flat_1` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'entity_id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'attribute_set_id',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'type_id',
  `cost` decimal(12,4) DEFAULT NULL COMMENT 'cost',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `gift_message_available` smallint(6) DEFAULT NULL COMMENT 'gift_message_available',
  `has_options` smallint(6) NOT NULL DEFAULT 0 COMMENT 'has_options',
  `image_label` varchar(255) DEFAULT NULL COMMENT 'image_label',
  `is_recurring` smallint(6) DEFAULT NULL COMMENT 'is_recurring',
  `links_exist` int(11) DEFAULT NULL COMMENT 'links_exist',
  `links_purchased_separately` int(11) DEFAULT NULL COMMENT 'links_purchased_separately',
  `links_title` varchar(255) DEFAULT NULL COMMENT 'links_title',
  `msrp` decimal(12,4) DEFAULT NULL COMMENT 'msrp',
  `msrp_display_actual_price_type` varchar(255) DEFAULT NULL COMMENT 'msrp_display_actual_price_type',
  `msrp_enabled` smallint(6) DEFAULT NULL COMMENT 'msrp_enabled',
  `name` varchar(255) DEFAULT NULL COMMENT 'name',
  `news_from_date` datetime DEFAULT NULL COMMENT 'news_from_date',
  `news_to_date` datetime DEFAULT NULL COMMENT 'news_to_date',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'price',
  `price_type` int(11) DEFAULT NULL COMMENT 'price_type',
  `price_view` int(11) DEFAULT NULL COMMENT 'price_view',
  `recurring_profile` text DEFAULT NULL COMMENT 'recurring_profile',
  `required_options` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'required_options',
  `shipment_type` int(11) DEFAULT NULL COMMENT 'shipment_type',
  `short_description` text DEFAULT NULL COMMENT 'short_description',
  `sku` varchar(64) DEFAULT NULL COMMENT 'sku',
  `sku_type` int(11) DEFAULT NULL COMMENT 'sku_type',
  `small_image` varchar(255) DEFAULT NULL COMMENT 'small_image',
  `small_image_label` varchar(255) DEFAULT NULL COMMENT 'small_image_label',
  `special_from_date` datetime DEFAULT NULL COMMENT 'special_from_date',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'special_price',
  `special_to_date` datetime DEFAULT NULL COMMENT 'special_to_date',
  `status` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'status',
  `tax_class_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'tax_class_id',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT 'thumbnail',
  `thumbnail_label` varchar(255) DEFAULT NULL COMMENT 'thumbnail_label',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'url_key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'url_path',
  `visibility` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'visibility',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'weight',
  `weight_type` int(11) DEFAULT NULL COMMENT 'weight_type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Flat (Store 1)';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav`
--

CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Dumping data for table `catalog_product_index_eav`
--

INSERT INTO `catalog_product_index_eav` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(7, 123, 1, 0),
(8, 123, 1, 0),
(9, 123, 1, 0),
(10, 123, 1, 0),
(11, 123, 1, 0),
(12, 123, 1, 0),
(13, 123, 1, 0),
(14, 123, 1, 0),
(15, 123, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_idx`
--

CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

INSERT INTO `catalog_product_index_eav_idx` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(7, 123, 1, 0),
(8, 123, 1, 0),
(9, 123, 1, 0),
(10, 123, 1, 0),
(11, 123, 1, 0),
(12, 123, 1, 0),
(13, 123, 1, 0),
(14, 123, 1, 0),
(15, 123, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_group_price`
--

CREATE TABLE `catalog_product_index_group_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price`
--

CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Dumping data for table `catalog_product_index_price`
--

INSERT INTO `catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(7, 0, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(7, 1, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(7, 2, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(7, 3, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(8, 0, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(8, 1, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(8, 2, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(8, 3, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(9, 0, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(9, 1, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(9, 2, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(9, 3, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(10, 0, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(10, 1, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(10, 2, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(10, 3, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(11, 0, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(11, 1, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(11, 2, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(11, 3, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(12, 0, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(12, 1, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(12, 2, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(12, 3, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(13, 0, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(13, 1, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(13, 2, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(13, 3, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(14, 0, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(14, 1, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(14, 2, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(14, 3, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(15, 0, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL),
(15, 1, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL),
(15, 2, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL),
(15, 3, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class Id',
  `price_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Id',
  `selection_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Selection Id',
  `group_type` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Group Type',
  `is_required` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Id',
  `selection_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Selection Id',
  `group_type` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Group Type',
  `is_required` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class Id',
  `price_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Maximum price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Maximum price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_idx`
--

CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_price_idx`
--

INSERT INTO `catalog_product_index_price_idx` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(7, 0, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(7, 1, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(7, 2, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(7, 3, 1, 0, '1584.0000', '1584.0000', '1584.0000', '1584.0000', NULL, NULL),
(8, 0, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(8, 1, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(8, 2, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(8, 3, 1, 0, '1340.0000', '1340.0000', '1340.0000', '1340.0000', NULL, NULL),
(9, 0, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(9, 1, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(9, 2, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(9, 3, 1, 0, '2560.0000', '1580.0000', '1580.0000', '1580.0000', NULL, NULL),
(10, 0, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(10, 1, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(10, 2, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(10, 3, 1, 0, '3648.0000', '3648.0000', '3648.0000', '3648.0000', NULL, NULL),
(11, 0, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(11, 1, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(11, 2, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(11, 3, 1, 0, '2599.0000', '2599.0000', '2599.0000', '2599.0000', NULL, NULL),
(12, 0, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(12, 1, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(12, 2, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(12, 3, 1, 0, '3025.0000', '3025.0000', '3025.0000', '3025.0000', NULL, NULL),
(13, 0, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(13, 1, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(13, 2, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(13, 3, 1, 0, '749.0000', '749.0000', '749.0000', '749.0000', NULL, NULL),
(14, 0, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(14, 1, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(14, 2, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(14, 3, 1, 0, '1850.0000', '1850.0000', '1850.0000', '1850.0000', NULL, NULL),
(15, 0, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL),
(15, 1, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL),
(15, 2, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL),
(15, 3, 1, 0, '899.9900', '899.9900', '899.9900', '899.9900', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_tmp`
--

CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_tier_price`
--

CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_website`
--

CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT 1 COMMENT 'Rate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Dumping data for table `catalog_product_index_website`
--

INSERT INTO `catalog_product_index_website` (`website_id`, `website_date`, `rate`) VALUES
(1, '2021-11-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link`
--

CREATE TABLE `catalog_product_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `linked_product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Link Type ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute`
--

CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';

--
-- Dumping data for table `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 1, 'position', 'int'),
(2, 3, 'position', 'int'),
(3, 3, 'qty', 'decimal'),
(4, 4, 'position', 'int'),
(5, 5, 'position', 'int');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_int`
--

CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_type`
--

CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';

--
-- Dumping data for table `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option`
--

CREATE TABLE `catalog_product_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) UNSIGNED DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_price`
--

CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Price ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_title`
--

CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Title ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_price`
--

CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Type Price ID',
  `option_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Type ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_title`
--

CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Type Title ID',
  `option_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Type ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_value`
--

CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Type ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_relation`
--

CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute`
--

CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Super Attribute ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_label`
--

CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `use_default` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Super Attribute ID',
  `value_index` varchar(255) DEFAULT NULL COMMENT 'Value Index',
  `is_percent` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Is Percent',
  `pricing_value` decimal(12,4) DEFAULT NULL COMMENT 'Pricing Value',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Pricing Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_link`
--

CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Parent ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_website`
--

CREATE TABLE `catalog_product_website` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Dumping data for table `catalog_product_website`
--

INSERT INTO `catalog_product_website` (`product_id`, `website_id`) VALUES
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement`
--

CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text DEFAULT NULL COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text DEFAULT NULL COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Html'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';

--
-- Dumping data for table `checkout_agreement`
--

INSERT INTO `checkout_agreement` (`agreement_id`, `name`, `content`, `content_height`, `checkbox_text`, `is_active`, `is_html`) VALUES
(1, 'Things to know', '<ul>\r\n<li>Any parcels we dispath is legit</li>\r\n<li>Please notify within 2days</li>\r\n<li>Please</li>\r\n</ul>', NULL, '<strong>I understand</strong>', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement_store`
--

CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

--
-- Dumping data for table `checkout_agreement_store`
--

INSERT INTO `checkout_agreement_store` (`agreement_id`, `store_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_block`
--

CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext DEFAULT NULL COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Block Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';

--
-- Dumping data for table `cms_block`
--

INSERT INTO `cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES
(2, 'Footer Main', 'footer_main', '        <div class=\"row our-company\">\r\n          <h4><strong>Our Company</strong></h4>\r\n            \r\n          <div class=\"col-md-12 link-column\">\r\n            <p><a href=\"{{store url=\"\"}}about/\">About</a></p>\r\n            <p><a href=\"{{store url=\"\"}}contacts/\">Contact</a></p>\r\n            <p><a href=\"{{store url=\"\"}}landing-page/\">Landing Page</a></p>\r\n          </div>\r\n          <div class=\"col-md-12 link-column\">\r\n            <p><a href=\"{{store url=\"\"}}terms-of-service/\">Terms of Service</a></p>\r\n            <p><a href=\"{{store url=\"\"}}index.php/privacy-policy-cookie-restriction-mode/\">Privacy Policy</a></p>\r\n<p><a href=\"{{store url=\"\"}}terms-of-service/\">Sitemap</a></p>\r\n          </div>\r\n            \r\n          <div class=\"col-md-12  social-links\">\r\n            <div class=\"col-md-6\">\r\n              <a href=\"\"><img src=\"{{media url=\"wysiwyg/social-facebook-logo.png\"}}\" alt=\"\" /></a>\r\n<a href=\"\"><img src=\"{{media url=\"wysiwyg/social-twitter-logo.png\"}}\" alt=\"\" /></a>\r\n <a href=\"\"><img src=\"{{media url=\"wysiwyg/social-youtube-logo.png\"}}\" alt=\"\" /></a>\r\n </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n\r\n<div class=\"row logo\">\r\n<div class=\"col-md-12\"><a href=\"/\"><img src=\"{{media url=\"wysiwyg/logo-v1.png\"}}\" alt=\"\" /></a></div>\r\n\r\n\r\n<div class=\"2\">\r\n\r\n</div>\r\n<div class=\"2\">\r\n\r\n</div>\r\n<div class=\"2\">\r\n\r\n</div>\r\n<div class=\"2\">\r\n\r\n</div>\r\n<div class=\"2\">\r\n\r\n</div>\r\n<div class=\"2\">\r\n\r\n</div>\r\n</div>\r\n\r\n<div class=\"row newsletter\">\r\n    <div class=\"col-md-12\">\r\n        <div class=\"block-title\">\r\n            <strong><span>Newsletter</span></strong>\r\n        </div>\r\n        <form action=\"{{store url=\"\"}}newsletter/subscriber/new/\" method=\"post\" id=\"newsletter-validate-detail\">\r\n            <div class=\"block-content\">\r\n                <div class=\"form-subscribe-header\">\r\n                    <label for=\"newsletter\">Sign Up for Our Newsletter:</label>\r\n                </div>\r\n                <div class=\"row\" style=\"align-items: center;\">\r\n                    <div class=\"col-md-8\">\r\n                        <div class=\"input-box\">\r\n                        <input type=\"email\" class=\"form-control\" autocapitalize=\"none\" autocorrect=\"off\" spellcheck=\"false\" name=\"email\" id=\"newsletter\" title=\"Sign up for our newsletter\">\r\n                    </div>\r\n                </div>\r\n                <div class=\"col-md-4\">\r\n                    <div class=\"actions\" style=\"margin: 0px\">\r\n                        <button type=\"submit\" class=\"form-control btn-primary\" title=\"Subscribe\"><span><span>Subscribe</span></span></button>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </form>\r\n        <script type=\"text/javascript\">\r\n        //<![CDATA[\r\n            var newsletterSubscriberFormDetail = new VarienForm(\'newsletter-validate-detail\');\r\n        //]]>\r\n        </script>\r\n\r\n        <div class=\"address\"><span><a href=\"maps.google.com\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> 123 ABC Lorem Ipsum dolor, Philippines</a></span></div>\r\n        \r\n        <div class=\"address\"><span><a href=\"mailto:sales@igamecommerce.com\"><i class=\"fa fa-envelope\" aria-hidden=\"true\"></i> sales@igamecommerce.com</a></span></div>\r\n        \r\n        <div class=\"address\"><span><a href=\"tel:+0312345678\"><i class=\"fa fa-phone\" aria-hidden=\"true\"></i> +031 234 5678</a></span></div>\r\n    </div>\r\n  </div>  </div>', '2021-07-26 01:30:03', '2021-11-19 00:15:09', 1),
(3, 'Cookie restriction notice', 'cookie_restriction_notice_block', '<p>This website requires cookies to provide all of its features. For more information on what data is contained in the cookies, please see our <a href=\"{{store direct_url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy page</a>. To accept cookies from this site, please click the Allow button below.</p>', '2021-07-26 01:30:03', '2021-07-26 01:30:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_block_store`
--

CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

--
-- Dumping data for table `cms_block_store`
--

INSERT INTO `cms_block_store` (`block_id`, `store_id`) VALUES
(2, 1),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `root_template` varchar(255) DEFAULT NULL COMMENT 'Page Template',
  `meta_keywords` text DEFAULT NULL COMMENT 'Page Meta Keywords',
  `meta_description` text DEFAULT NULL COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext DEFAULT NULL COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Page Sort Order',
  `layout_update_xml` text DEFAULT NULL COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text DEFAULT NULL COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(1, '404 Not Found 1', 'two_columns_right', 'Page keywords', 'Page description', 'no-route', NULL, '\n<div class=\"page-title\"><h1>Whoops, our bad...</h1></div>\n<dl>\n    <dt>The page you requested was not found, and we have a fine guess why.</dt>\n    <dd>\n        <ul class=\"disc\">\n            <li>If you typed the URL directly, please make sure the spelling is correct.</li>\n            <li>If you clicked on a link to get here, the link is outdated.</li>\n        </ul>\n    </dd>\n</dl>\n<dl>\n    <dt>What can you do?</dt>\n    <dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\n    <dd>\n        <ul class=\"disc\">\n            <li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\n            <li>Use the search bar at the top of the page to search for your products.</li>\n            <li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a>\n            <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li>\n        </ul>\n    </dd>\n</dl>\n', '2021-07-26 01:30:03', '2021-07-26 01:30:03', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Game Commerce', 'one_column', NULL, NULL, 'landing-page', NULL, '<div class=\"section-hero\">\r\n    <div class=\"row\">\r\n        <div class=\"col-md-12\">\r\n              <img src=\"{{media url=\"wysiwyg/logo-v1.png\"}}\" alt=\"\" class=\"fullwidth-image\"  />\r\n<h1 style=\"text-align:center;\">Most Trusted Digital Commerce in Planet</h1>\r\n        </div>\r\n    </div>\r\n\r\n</div>\r\n<div class=\"featured-divider\">\r\n<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1920 128.49\"><defs><style>.f5f949bb-b7d9-4eab-84f2-c0ff88761255{fill:#1b262c;opacity:1;}</style></defs><title>Asset 9</title><g id=\"a90d1eb0-0991-4be5-80eb-6280c7b224a4\" data-name=\"Layer 2\"><g id=\"afaea0d3-c5ce-4443-b669-bcc985e5622d\" data-name=\"Layer 3\"><path d=\"M1920,128.49H0v-75s597-131,1532,17c214,42,388-19,388-34Z\"/><path class=\"f5f949bb-b7d9-4eab-84f2-c0ff88761255\" d=\"M1920,128.49H0v-75s597-131,1532,17c214,42,388-19,388-34Z\"/></g></g></svg>\r\n</div>\r\n<div class=\"section-featured\">\r\n    <div class=\"row\">\r\n        <div class=\"col-md-4\">\r\n            <img class=\"global-image\" src=\"{{media url=\"wysiwyg/Placeholder_box.png\"}}\" />\r\n        </div>\r\n        <div class=\"col-md-8\">\r\n<hr>\r\n            {{widget type=\"cms/widget_block\" template=\"cms/widget/static_block/default.phtml\" block_id=\"6\"}}\r\n<hr>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"featured-divider\">\r\n<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"100%\" height=\"128.494; margin-top: -1%\" viewBox=\"0 0 1920 128.494\">\r\n  <g id=\"Layer_2\" data-name=\"Layer 2\" transform=\"translate(1920 128.49) rotate(180)\">\r\n    <g id=\"Layer_3\" data-name=\"Layer 3\">\r\n      <path id=\"Path_10\" data-name=\"Path 10\" d=\"M1920,128.49H0v-75s597-131,1532,17c214,42,388-19,388-34Z\"/>\r\n      <path id=\"Path_11\" data-name=\"Path 11\" d=\"M1920,128.49H0v-75s597-131,1532,17c214,42,388-19,388-34Z\" fill=\"#1b262c\"/>\r\n    </g>\r\n  </g>\r\n</svg>\r\n</div>\r\n\r\n<div class=\"section-games\">\r\n    <h2>All time Games</h2>\r\n        {{widget type=\"catalog/product_widget_new\" display_type=\"all_products\" products_count=\"10\" template=\"custom/homepage/home_games.phtml\"}}\r\n      \r\n    <div class=\"row row-notice\">\r\n        <div class=\"col-md-6\">\r\n            <h3>Feeling Excited?<br>Find All of our Legitimate Digital License</h3><p>Terms & Conditions may apply</p>\r\n        </div>\r\n        <div class=\"col-md-6\">\r\n            <a class=\"global-button-container\" href=\"{{config path=\"web/secure/base_url\"}}games\">\r\n                <button class=\"form-control global-button more-games-button\">Browse More Games</button>\r\n            </a>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n\r\n\r\n<div class=\"games-cat-divider\">\r\n<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" width=\"100%\" height=\"127\" viewBox=\"0 0 1920 127\">\r\n  <g id=\"Layer_4\" data-name=\"Layer 4\">\r\n    <path id=\"Path_48\" data-name=\"Path 48\" d=\"M0,127s1835-144.13,1920,0l-1-117H0\" fill=\"#6f7080\" opacity=\"0.2\"/>\r\n    <path id=\"Path_49\" data-name=\"Path 49\" d=\"M0,116s1835-142.9,1920,0V0H0\" fill=\"#6f7080\"/>\r\n  </g>\r\n</svg>\r\n\r\n</div>\r\n\r\n<div class=\"section-category\">\r\n    <h2>Select your genre</h2>\r\n    <div class=\"row\">\r\n        <div class=\"col-md-12 category-column\">\r\n            {{widget type=\"catalog/category_widget_link\" template=\"catalog/category/widget/link/home_category.phtml\" id_path=\"category/6\"}}\r\n        </div>\r\n    </div>\r\n</div>', '2021-07-26 01:30:03', '2021-11-18 05:28:40', 1, 0, '<reference name=\"head\">\r\n    <action method=\"setData\"><key>title</key><value>Game Commerce</value></action>\r\n</reference>\r\n', 'iTemplate/default', 'one_column', '<reference name=\"head\">\r\n  <action method=\"addItem\">\r\n    <type>skin_css</type><script>css/home.css</script>\r\n  </action>\r\n</reference>', NULL, NULL),
(3, 'About Us', 'one_column', NULL, NULL, 'about', NULL, '<div class=\"page-title\">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<p style=\"line-height: 1.2em;\"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style=\"color: #888; font: 1.2em/1.4em georgia, serif;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p>\r\n\r\n<p><strong style=\"color: #de036f;\">Lorem Hello World<br /></strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper</p>\r\n<p><strong style=\"color: #de036f;\">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class=\"divider\"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style=\"line-height: 1.2em;\"><strong style=\"font: italic 2em Georgia, serif;\">John Doe</strong><br /> <small>Some important guy</small></p>\r\n', '2021-07-26 01:30:03', '2021-08-01 20:47:49', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Customer Service', 'three_columns', NULL, NULL, 'customer-service', NULL, '<div class=\"page-title\">\n<h1>Customer Service</h1>\n</div>\n<ul class=\"disc\">\n<li><a href=\"#answer1\">Shipping &amp; Delivery</a></li>\n<li><a href=\"#answer2\">Privacy &amp; Security</a></li>\n<li><a href=\"#answer3\">Returns &amp; Replacements</a></li>\n<li><a href=\"#answer4\">Ordering</a></li>\n<li><a href=\"#answer5\">Payment, Pricing &amp; Promotions</a></li>\n<li><a href=\"#answer6\">Viewing Orders</a></li>\n<li><a href=\"#answer7\">Updating Account Information</a></li>\n</ul>\n<dl>\n<dt id=\"answer1\">Shipping &amp; Delivery</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer2\">Privacy &amp; Security</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer3\">Returns &amp; Replacements</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer4\">Ordering</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer5\">Payment, Pricing &amp; Promotions</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer6\">Viewing Orders</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\n Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\n justo.</dd>\n<dt id=\"answer7\">Updating Account Information</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\n Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\n Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\n faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\n Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\n justo.</dd>\n</dl>', '2021-07-26 01:30:03', '2021-07-26 01:30:03', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Enable Cookies', 'one_column', NULL, NULL, 'enable-cookies', NULL, '<div class=\"std\">\n    <ul class=\"messages\">\n        <li class=\"notice-msg\">\n            <ul>\n                <li>Please enable cookies in your web browser to continue.</li>\n            </ul>\n        </li>\n    </ul>\n    <div class=\"page-title\">\n        <h1><a name=\"top\"></a>What are Cookies?</h1>\n    </div>\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website.\n    On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically\n    whenever you visit our site so that we can personalize your experience and provide you with better service.\n    We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes.\n     If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase\n     or take advantage of certain features of our website, such as storing items in your Shopping Cart or\n     receiving personalized recommendations. As a result, we strongly encourage you to configure your web\n     browser to accept cookies from our website.</p>\n    <h2 class=\"subtitle\">Enabling Cookies</h2>\n    <ul class=\"disc\">\n        <li><a href=\"#ie7\">Internet Explorer 7.x</a></li>\n        <li><a href=\"#ie6\">Internet Explorer 6.x</a></li>\n        <li><a href=\"#firefox\">Mozilla/Firefox</a></li>\n        <li><a href=\"#opera\">Opera 7.x</a></li>\n    </ul>\n    <h3><a name=\"ie7\"></a>Internet Explorer 7.x</h3>\n    <ol>\n        <li>\n            <p>Start Internet Explorer</p>\n        </li>\n        <li>\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-1.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click the <strong>Privacy</strong> tab</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-2.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click the <strong>Advanced</strong> button</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-3.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>,\n            put another check mark in the <strong>Always accept session cookies </strong>box</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-4.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click <strong>OK</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-5.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click <strong>OK</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-6.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Restart Internet Explore</p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n    <h3><a name=\"ie6\"></a>Internet Explorer 6.x</h3>\n    <ol>\n        <li>\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie6-1.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click on the <strong>Privacy</strong> tab</p>\n        </li>\n        <li>\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>)\n            under <strong>Settings</strong>. Click <strong>OK</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie6-2.gif\"}}\" alt=\"\" /></p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n    <h3><a name=\"firefox\"></a>Mozilla/Firefox</h3>\n    <ol>\n        <li>\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\n            <p><img src=\"{{skin url=\"images/cookies/firefox.png\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Expand the <strong>Cookies</strong> section</p>\n        </li>\n        <li>\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\n        </li>\n        <li>\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n    <h3><a name=\"opera\"></a>Opera 7.x</h3>\n    <ol>\n        <li>\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\n            <p><img src=\"{{skin url=\"images/cookies/opera.png\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong>\n            should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\n        </li>\n        <li>\n            <p>Save changes by clicking <strong>Ok</strong></p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n</div>\n', '2021-07-26 01:30:03', '2021-07-26 01:30:03', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Privacy Policy', 'one_column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy Policy', '<p style=\"color: #ff0000; font-weight: bold; font-size: 13px\">\n    Please replace this text with you Privacy Policy.\n    Please add any additional cookies your website uses below (e.g., Google Analytics)\n</p>\n<p>\n    This privacy policy sets out how {{config path=\"general/store_information/name\"}} uses and protects any information\n    that you give {{config path=\"general/store_information/name\"}} when you use this website.\n    {{config path=\"general/store_information/name\"}} is committed to ensuring that your privacy is protected.\n    Should we ask you to provide certain information by which you can be identified when using this website,\n    then you can be assured that it will only be used in accordance with this privacy statement.\n    {{config path=\"general/store_information/name\"}} may change this policy from time to time by updating this page.\n    You should check this page from time to time to ensure that you are happy with any changes.\n</p>\n<h2>What we collect</h2>\n<p>We may collect the following information:</p>\n<ul>\n    <li>name</li>\n    <li>contact information including email address</li>\n    <li>demographic information such as postcode, preferences and interests</li>\n    <li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<p>\n    For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\n    We require this information to understand your needs and provide you with a better service,\n    and in particular for the following reasons:\n</p>\n<ul>\n    <li>Internal record keeping.</li>\n    <li>We may use the information to improve our products and services.</li>\n    <li>\n        We may periodically send promotional emails about new products, special offers or other information which we\n        think you may find interesting using the email address which you have provided.\n    </li>\n    <li>\n        From time to time, we may also use your information to contact you for market research purposes.\n        We may contact you by email, phone, fax or mail. We may use the information to customise the website\n        according to your interests.\n    </li>\n</ul>\n<h2>Security</h2>\n<p>\n    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure,\n    we have put in place suitable physical, electronic and managerial procedures to safeguard and secure\n    the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\n    A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n    Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n    a particular site. Cookies allow web applications to respond to you as an individual. The web application\n    can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n    your preferences.\n</p>\n<p>\n    We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic\n    and improve our website in order to tailor it to customer needs. We only use this information for statistical\n    analysis purposes and then the data is removed from the system.\n</p>\n<p>\n    Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful\n    and which you do not. A cookie in no way gives us access to your computer or any information about you,\n    other than the data you choose to share with us. You can choose to accept or decline cookies.\n    Most web browsers automatically accept cookies, but you can usually modify your browser setting\n    to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n</p>\n<h2>Links to other websites</h2>\n<p>\n    Our website may contain links to other websites of interest. However, once you have used these links\n    to leave our site, you should note that we do not have any control over that other website.\n    Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n    visiting such sites and such sites are not governed by this privacy statement.\n    You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n    <li>\n        whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n        that you do not want the information to be used by anybody for direct marketing purposes\n    </li>\n    <li>\n        if you have previously agreed to us using your personal information for direct marketing purposes,\n        you may change your mind at any time by writing to or emailing us at\n        {{config path=\"trans_email/ident_general/email\"}}\n    </li>\n</ul>\n<p>\n    We will not sell, distribute or lease your personal information to third parties unless we have your permission\n    or are required by law to do so. We may use your personal information to send you promotional information\n    about third parties which we think you may find interesting if you tell us that you wish this to happen.\n</p>\n<p>\n    You may request details of personal information which we hold about you under the Data Protection Act 1998.\n    A small fee will be payable. If you would like a copy of the information held on you please write to\n    {{config path=\"general/store_information/address\"}}.\n</p>\n<p>\n    If you believe that any information we are holding on you is incorrect or incomplete,\n    please write to or email us as soon as possible, at the above address.\n    We will promptly correct any information found to be incorrect.\n</p>\n<h2><a name=\"list\"></a>List of cookies we collect</h2>\n<p>The table below lists the cookies we collect and what information they store.</p>\n<table class=\"data-table\">\n    <thead>\n        <tr>\n            <th>COOKIE name</th>\n            <th>COOKIE Description</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <th>CART</th>\n            <td>The association with your shopping cart.</td>\n        </tr>\n        <tr>\n            <th>CATEGORY_INFO</th>\n            <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n        </tr>\n        <tr>\n            <th>COMPARE</th>\n            <td>The items that you have in the Compare Products list.</td>\n        </tr>\n        <tr>\n            <th>CURRENCY</th>\n            <td>Your preferred currency</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER</th>\n            <td>An encrypted version of your customer id with the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_AUTH</th>\n            <td>An indicator if you are currently logged into the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_INFO</th>\n            <td>An encrypted version of the customer group you belong to.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_SEGMENT_IDS</th>\n            <td>Stores the Customer Segment ID</td>\n        </tr>\n        <tr>\n            <th>EXTERNAL_NO_CACHE</th>\n            <td>A flag, which indicates whether caching is disabled or not.</td>\n        </tr>\n        <tr>\n            <th>FRONTEND</th>\n            <td>You sesssion ID on the server.</td>\n        </tr>\n        <tr>\n            <th>GUEST-VIEW</th>\n            <td>Allows guests to edit their orders.</td>\n        </tr>\n        <tr>\n            <th>LAST_CATEGORY</th>\n            <td>The last category you visited.</td>\n        </tr>\n        <tr>\n            <th>LAST_PRODUCT</th>\n            <td>The most recent product you have viewed.</td>\n        </tr>\n        <tr>\n            <th>NEWMESSAGE</th>\n            <td>Indicates whether a new message has been received.</td>\n        </tr>\n        <tr>\n            <th>NO_CACHE</th>\n            <td>Indicates whether it is allowed to use cache.</td>\n        </tr>\n        <tr>\n            <th>PERSISTENT_SHOPPING_CART</th>\n            <td>A link to information about your cart and viewing history if you have asked the site.</td>\n        </tr>\n        <tr>\n            <th>POLL</th>\n            <td>The ID of any polls you have recently voted in.</td>\n        </tr>\n        <tr>\n            <th>POLLN</th>\n            <td>Information on what polls you have voted on.</td>\n        </tr>\n        <tr>\n            <th>RECENTLYCOMPARED</th>\n            <td>The items that you have recently compared.            </td>\n        </tr>\n        <tr>\n            <th>STF</th>\n            <td>Information on products you have emailed to friends.</td>\n        </tr>\n        <tr>\n            <th>STORE</th>\n            <td>The store view or language you have selected.</td>\n        </tr>\n        <tr>\n            <th>USER_ALLOWED_SAVE_COOKIE</th>\n            <td>Indicates whether a customer allowed to use cookies.</td>\n        </tr>\n        <tr>\n            <th>VIEWED_PRODUCT_IDS</th>\n            <td>The products that you have recently viewed.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST</th>\n            <td>An encrypted list of products added to your Wishlist.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST_CNT</th>\n            <td>The number of items in your Wishlist.</td>\n        </tr>\n    </tbody>\n</table>', '2021-07-26 01:30:03', '2021-07-26 01:30:03', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Test', 'one_column', NULL, NULL, 'test', 'Hellow', '<p>Hello World Magento</p>\r\n<div class=\"links\">\r\n<ul>\r\n<li><a href=\"http://127.0.0.1/magento-mirror-magento-1.9/index.php/admin/cms_wysiwyg/directive/___directive/e3tzdG9yZSB1cmw9IiJ9fQ,,/key/0b82a93500f3b6ba8a072bb102209b3e/about-magento-demo-store/\">About Us</a></li>\r\n<li><a href=\"{{store url=\"\"}}contacts/\">Contact Us</a></li>\r\n<li><a href=\"http://127.0.0.1/magento-mirror-magento-1.9/index.php/admin/cms_wysiwyg/directive/___directive/e3tzdG9yZSB1cmw9IiJ9fQ,,/key/0b82a93500f3b6ba8a072bb102209b3e/customer-service/\">Customer Service</a></li>\r\n<li><a href=\"{{store url=\"\"}}games/\">Games</a></li>\r\n</ul>\r\n</div>', '2021-07-26 19:13:51', '2021-07-30 01:28:04', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '???Contact US', 'one_column', NULL, NULL, 'contact-us', NULL, 'Contact us', '2021-07-30 01:25:41', '2021-07-30 01:25:41', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Games', 'one_column', NULL, NULL, 'games', 'All Games', '<p>{{widget type=\"catalog/product_widget_new\" display_type=\"all_products\"  show_pager=\"1\" products_per_page=\"18\"    template=\"custom/homepage/home_games.phtml\"}}</p>', '2021-07-30 05:08:39', '2021-09-24 03:57:30', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Category Page', 'one_column', NULL, NULL, 'category', NULL, '<p>{{widget type=\"catalog/category_widget_link\" template=\"catalog/category/widget/link/link_block.phtml\" id_path=\"category/3\"}}</p>', '2021-08-02 00:22:56', '2021-08-02 00:22:56', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Wishlist', 'one_column', NULL, NULL, 'customer/account/wishlist', NULL, 'h', '2021-09-21 06:07:29', '2021-09-23 04:48:35', 1, 0, NULL, 'iTemplate/default', NULL, NULL, NULL, NULL),
(16, 'My Orders', 'one_column', NULL, NULL, 'customer/account/my-orders', NULL, 'a', '2021-09-23 05:14:20', '2021-09-23 05:43:57', 1, 0, NULL, NULL, NULL, '<template>sales/order/items/renderer/default.phtml</template>', NULL, NULL),
(17, 'Edit Account', 'one_column', NULL, NULL, 'edit-account', NULL, 'a', '2021-09-23 05:21:28', '2021-09-23 05:21:28', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Game Commerce', 'one_column', NULL, NULL, 'index', NULL, 'Hallow ', '2021-11-18 05:29:08', '2021-11-18 05:30:44', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_store`
--

CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `cms_page_store`
--

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(2, 1),
(3, 1),
(4, 0),
(5, 0),
(6, 0),
(7, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache`
--

CREATE TABLE `core_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob DEFAULT NULL COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

-- --------------------------------------------------------

--
-- Table structure for table `core_cache_option`
--

CREATE TABLE `core_cache_option` (
  `code` varchar(32) NOT NULL COMMENT 'Code',
  `value` smallint(6) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache Options';

--
-- Dumping data for table `core_cache_option`
--

INSERT INTO `core_cache_option` (`code`, `value`) VALUES
('block_html', 0),
('collections', 0),
('config', 0),
('config_api', 0),
('config_api2', 0),
('eav', 0),
('layout', 0),
('translate', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache_tag`
--

CREATE TABLE `core_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

-- --------------------------------------------------------

--
-- Table structure for table `core_config_data`
--

CREATE TABLE `core_config_data` (
  `config_id` int(10) UNSIGNED NOT NULL COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text DEFAULT NULL COMMENT 'Config Value',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config Data';

--
-- Dumping data for table `core_config_data`
--

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`, `updated_at`) VALUES
(1, 'default', 0, 'advanced/modules_disable_output/Mage_Backup', '1', '2021-07-26 09:29:48'),
(2, 'default', 0, 'general/region/display_all', '1', '2021-07-26 09:29:57'),
(3, 'default', 0, 'general/region/state_required', 'AT,CA,EE,FI,FR,DE,LV,LT,RO,ES,CH,US', '2021-07-26 13:07:27'),
(4, 'default', 0, 'catalog/category/root_id', '2', '2021-07-26 09:30:04'),
(5, 'default', 0, 'payment/paypal_express/skip_order_review_step', '1', '2021-07-26 09:30:04'),
(6, 'default', 0, 'payment/payflow_link/mobile_optimized', '1', '2021-07-26 09:30:04'),
(7, 'default', 0, 'payment/payflow_advanced/mobile_optimized', '1', '2021-07-26 09:30:04'),
(8, 'default', 0, 'payment/hosted_pro/mobile_optimized', '1', '2021-07-26 09:30:04'),
(9, 'default', 0, 'admin/dashboard/enable_charts', '1', '2021-07-26 09:30:04'),
(10, 'default', 0, 'web/unsecure/base_url', 'http://127.0.0.1/magento-mirror-magento-1.9/', '2021-07-26 09:30:04'),
(11, 'default', 0, 'web/secure/base_url', 'http://127.0.0.1/magento-mirror-magento-1.9/', '2021-07-26 09:30:04'),
(12, 'default', 0, 'general/locale/code', 'en_US', '2021-07-26 09:30:04'),
(13, 'default', 0, 'general/locale/timezone', 'Asia/Manila', '2021-07-26 09:30:04'),
(14, 'default', 0, 'currency/options/base', 'PHP', '2021-07-26 09:30:04'),
(15, 'default', 0, 'currency/options/default', 'PHP', '2021-07-26 09:30:04'),
(16, 'default', 0, 'currency/options/allow', 'PHP', '2021-07-26 09:30:04'),
(17, 'default', 0, 'design/package/name', 'iTemplate', '2021-07-29 15:05:14'),
(18, 'default', 0, 'design/package/ua_regexp', 'a:0:{}', '2021-07-26 11:49:27'),
(19, 'default', 0, 'design/theme/locale', NULL, '2021-07-26 11:49:27'),
(20, 'default', 0, 'design/theme/template', NULL, '2021-07-26 11:49:27'),
(21, 'default', 0, 'design/theme/template_ua_regexp', 'a:0:{}', '2021-07-26 11:49:27'),
(22, 'default', 0, 'design/theme/skin', NULL, '2021-07-26 11:49:27'),
(23, 'default', 0, 'design/theme/skin_ua_regexp', 'a:0:{}', '2021-07-26 11:49:27'),
(24, 'default', 0, 'design/theme/layout', NULL, '2021-07-26 11:49:27'),
(25, 'default', 0, 'design/theme/layout_ua_regexp', 'a:0:{}', '2021-07-26 11:49:27'),
(26, 'default', 0, 'design/theme/default', NULL, '2021-07-26 11:49:27'),
(27, 'default', 0, 'design/theme/default_ua_regexp', 'a:0:{}', '2021-07-26 11:49:27'),
(28, 'default', 0, 'design/head/default_title', 'Game Commerce', '2021-07-26 12:31:29'),
(29, 'default', 0, 'design/head/title_prefix', NULL, '2021-07-26 11:49:27'),
(30, 'default', 0, 'design/head/title_suffix', NULL, '2021-07-26 11:49:27'),
(31, 'default', 0, 'design/head/default_description', NULL, '2021-07-26 12:31:29'),
(32, 'default', 0, 'design/head/default_keywords', NULL, '2021-07-27 12:35:23'),
(33, 'default', 0, 'design/head/default_robots', 'INDEX,FOLLOW', '2021-07-26 11:49:27'),
(34, 'default', 0, 'design/head/includes', NULL, '2021-07-26 11:49:27'),
(35, 'default', 0, 'design/head/demonotice', '0', '2021-07-26 11:49:27'),
(36, 'default', 0, 'design/header/logo_src', 'images/custom/logo-v1.png', '2021-09-09 13:57:57'),
(37, 'default', 0, 'design/header/logo_alt', 'Game Commerce', '2021-07-26 12:33:41'),
(38, 'default', 0, 'design/header/logo_src_small', 'images/custom/favicon-v1.png', '2021-09-09 13:57:57'),
(39, 'default', 0, 'design/header/welcome', NULL, '2021-07-26 12:33:41'),
(40, 'default', 0, 'design/footer/copyright', '&copy; 2021 IvrgsDemo Store. All Rights Reserved.', '2021-07-27 12:35:23'),
(41, 'default', 0, 'design/footer/absolute_footer', NULL, '2021-07-26 11:49:27'),
(42, 'default', 0, 'design/watermark/image_size', NULL, '2021-07-26 11:49:27'),
(43, 'default', 0, 'design/watermark/image_imageOpacity', NULL, '2021-07-26 11:49:27'),
(44, 'default', 0, 'design/watermark/image_position', 'stretch', '2021-07-26 11:49:27'),
(45, 'default', 0, 'design/watermark/small_image_size', NULL, '2021-07-26 11:49:27'),
(46, 'default', 0, 'design/watermark/small_image_imageOpacity', NULL, '2021-07-26 11:49:27'),
(47, 'default', 0, 'design/watermark/small_image_position', 'stretch', '2021-07-26 11:49:27'),
(48, 'default', 0, 'design/watermark/thumbnail_size', NULL, '2021-07-26 11:49:27'),
(49, 'default', 0, 'design/watermark/thumbnail_imageOpacity', NULL, '2021-07-26 11:49:27'),
(50, 'default', 0, 'design/watermark/thumbnail_position', 'stretch', '2021-07-26 11:49:27'),
(51, 'default', 0, 'design/pagination/pagination_frame', '4', '2021-09-10 11:48:29'),
(52, 'default', 0, 'design/pagination/pagination_frame_skip', NULL, '2021-07-26 11:49:27'),
(53, 'default', 0, 'design/pagination/anchor_text_for_previous', NULL, '2021-09-10 11:39:39'),
(54, 'default', 0, 'design/pagination/anchor_text_for_next', NULL, '2021-09-10 11:39:39'),
(55, 'default', 0, 'design/email/logo_alt', NULL, '2021-07-26 11:49:27'),
(56, 'default', 0, 'design/email/logo_width', NULL, '2021-07-26 11:49:27'),
(57, 'default', 0, 'design/email/logo_height', NULL, '2021-07-26 11:49:27'),
(58, 'default', 0, 'design/email/header', 'design_email_header', '2021-07-26 11:49:27'),
(59, 'default', 0, 'design/email/footer', 'design_email_footer', '2021-07-26 11:49:27'),
(60, 'default', 0, 'design/email/css_non_inline', 'email-non-inline.css', '2021-07-26 11:49:27'),
(61, 'default', 0, 'design/head/shortcut_icon', 'default/favicon-v1.png', '2021-09-09 13:57:57'),
(62, 'default', 0, 'general/country/default', 'PH', '2021-07-27 12:31:08'),
(63, 'default', 0, 'general/country/allow', 'PH', '2021-07-27 12:31:08'),
(64, 'default', 0, 'general/country/optional_zip_countries', 'HK,IE,MO,PA', '2021-07-26 13:07:27'),
(65, 'default', 0, 'general/country/eu_countries', 'AT,BE,BG,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LT,LU,MT,NL,PL,PT,RO,SK,SI,ES,SE,GB', '2021-07-26 13:07:27'),
(66, 'default', 0, 'general/locale/firstday', '0', '2021-07-26 13:07:27'),
(67, 'default', 0, 'general/locale/weekend', '0,6', '2021-07-26 13:07:27'),
(68, 'default', 0, 'general/store_information/name', 'Game Commerce', '2021-07-26 13:07:27'),
(69, 'default', 0, 'general/store_information/phone', NULL, '2021-07-26 13:07:27'),
(70, 'default', 0, 'general/store_information/hours', NULL, '2021-07-26 13:07:27'),
(71, 'default', 0, 'general/store_information/merchant_country', 'PH', '2021-07-26 13:07:27'),
(72, 'default', 0, 'general/store_information/merchant_vat_number', NULL, '2021-07-26 13:07:27'),
(73, 'default', 0, 'general/store_information/address', 'PH', '2021-07-27 12:31:46'),
(74, 'default', 0, 'currency/currencyconverterapi/active', '1', '2021-07-27 12:37:32'),
(75, 'default', 0, 'currency/currencyconverterapi/timeout', '100', '2021-07-27 12:37:32'),
(76, 'default', 0, 'currency/currencyconverterapi/api_key', NULL, '2021-07-27 12:37:32'),
(77, 'default', 0, 'currency/fixerio/active', '1', '2021-07-27 12:37:32'),
(78, 'default', 0, 'currency/fixerio/timeout', '100', '2021-07-27 12:37:32'),
(79, 'default', 0, 'currency/fixerio/api_key', NULL, '2021-07-27 12:37:32'),
(80, 'default', 0, 'currency/import/enabled', '0', '2021-07-27 12:37:32'),
(81, 'default', 0, 'currency/import/service', 'currencyconverterapi', '2021-07-27 12:37:32'),
(82, 'default', 0, 'crontab/jobs/currency_rates_update/schedule/cron_expr', '0 0 * * *', '2021-07-27 12:37:32'),
(83, 'default', 0, 'currency/import/time', '00,00,00', '2021-07-27 12:37:32'),
(84, 'default', 0, 'currency/import/frequency', 'D', '2021-07-27 12:37:32'),
(85, 'default', 0, 'currency/import/error_email', NULL, '2021-07-27 12:37:32'),
(86, 'default', 0, 'currency/import/error_email_identity', 'general', '2021-07-27 12:37:32'),
(87, 'default', 0, 'currency/import/error_email_template', 'currency_import_error_email_template', '2021-07-27 12:37:32'),
(88, 'default', 0, 'trans_email/ident_general/name', 'Owner', '2021-07-27 12:38:56'),
(89, 'default', 0, 'trans_email/ident_general/email', 'owner@example.com', '2021-07-27 12:38:56'),
(90, 'default', 0, 'trans_email/ident_sales/name', 'Sales', '2021-07-27 12:38:56'),
(91, 'default', 0, 'trans_email/ident_sales/email', 'sales@example.com', '2021-07-27 12:38:56'),
(92, 'default', 0, 'trans_email/ident_support/name', 'CustomerSupport', '2021-07-27 12:38:56'),
(93, 'default', 0, 'trans_email/ident_support/email', 'support@example.com', '2021-07-27 12:38:56'),
(94, 'default', 0, 'trans_email/ident_custom1/name', 'Custom 1', '2021-07-27 12:38:56'),
(95, 'default', 0, 'trans_email/ident_custom1/email', 'custom1@example.com', '2021-07-27 12:38:56'),
(96, 'default', 0, 'trans_email/ident_custom2/name', 'Custom 2', '2021-07-27 12:38:56'),
(97, 'default', 0, 'trans_email/ident_custom2/email', 'custom2@example.com', '2021-07-27 12:38:56'),
(98, 'default', 0, 'catalog/frontend/list_mode', 'grid-list', '2021-07-27 12:47:37'),
(99, 'default', 0, 'catalog/frontend/grid_per_page_values', '12,24,36', '2021-07-27 12:47:37'),
(100, 'default', 0, 'catalog/frontend/grid_per_page', '12', '2021-07-27 12:47:37'),
(101, 'default', 0, 'catalog/frontend/list_per_page_values', '5,10,15,20,25', '2021-07-27 12:47:37'),
(102, 'default', 0, 'catalog/frontend/list_per_page', '10', '2021-07-27 12:47:37'),
(103, 'default', 0, 'catalog/frontend/default_sort_by', 'position', '2021-07-27 12:47:37'),
(104, 'default', 0, 'catalog/frontend/list_allow_all', '0', '2021-07-27 12:47:37'),
(105, 'default', 0, 'catalog/frontend/parse_url_directives', '1', '2021-07-27 12:47:37'),
(106, 'default', 0, 'catalog/sitemap/tree_mode', '1', '2021-10-11 12:26:11'),
(107, 'default', 0, 'catalog/sitemap/lines_perpage', '30', '2021-07-27 12:47:37'),
(108, 'default', 0, 'catalog/review/allow_guest', '1', '2021-07-27 12:47:37'),
(109, 'default', 0, 'catalog/product_image/base_width', '2100', '2021-07-30 04:11:15'),
(110, 'default', 0, 'catalog/product_image/small_width', '210', '2021-07-27 12:47:37'),
(111, 'default', 0, 'catalog/product_image/max_dimension', '5000', '2021-07-27 12:47:37'),
(112, 'default', 0, 'catalog/productalert/allow_price', '0', '2021-07-27 12:47:37'),
(113, 'default', 0, 'catalog/productalert/email_price_template', 'catalog_productalert_email_price_template', '2021-07-27 12:47:37'),
(114, 'default', 0, 'catalog/productalert/allow_stock', '0', '2021-07-27 12:47:37'),
(115, 'default', 0, 'catalog/productalert/email_stock_template', 'catalog_productalert_email_stock_template', '2021-07-27 12:47:37'),
(116, 'default', 0, 'catalog/productalert/email_identity', 'general', '2021-07-27 12:47:37'),
(117, 'default', 0, 'catalog/productalert_cron/frequency', 'D', '2021-07-27 12:47:37'),
(118, 'default', 0, 'crontab/jobs/catalog_product_alert/schedule/cron_expr', '0 0 * * *', '2021-07-27 12:47:37'),
(119, 'default', 0, 'crontab/jobs/catalog_product_alert/run/model', 'productalert/observer::process', '2021-07-27 12:47:37'),
(120, 'default', 0, 'catalog/productalert_cron/time', '00,00,00', '2021-07-27 12:47:37'),
(121, 'default', 0, 'catalog/productalert_cron/error_email', NULL, '2021-07-27 12:47:37'),
(122, 'default', 0, 'catalog/productalert_cron/error_email_identity', 'general', '2021-07-27 12:47:37'),
(123, 'default', 0, 'catalog/productalert_cron/error_email_template', 'catalog_productalert_cron_error_email_template', '2021-07-27 12:47:37'),
(124, 'default', 0, 'catalog/recently_products/scope', 'website', '2021-07-27 12:47:37'),
(125, 'default', 0, 'catalog/recently_products/viewed_count', '5', '2021-07-27 12:47:37'),
(126, 'default', 0, 'catalog/recently_products/compared_count', '5', '2021-07-27 12:47:37'),
(127, 'default', 0, 'catalog/price/scope', '0', '2021-07-27 12:47:37'),
(128, 'default', 0, 'catalog/layered_navigation/display_product_count', '1', '2021-07-27 12:47:37'),
(129, 'default', 0, 'catalog/layered_navigation/price_range_calculation', 'auto', '2021-07-27 12:47:37'),
(130, 'default', 0, 'catalog/seo/site_map', '1', '2021-07-27 12:47:37'),
(131, 'default', 0, 'catalog/seo/search_terms', '1', '2021-07-27 12:47:37'),
(132, 'default', 0, 'catalog/seo/product_url_suffix', NULL, '2021-10-11 08:31:02'),
(133, 'default', 0, 'catalog/seo/category_url_suffix', NULL, '2021-10-11 08:31:02'),
(134, 'default', 0, 'catalog/seo/product_use_categories', '1', '2021-10-11 08:29:50'),
(135, 'default', 0, 'catalog/seo/save_rewrites_history', '0', '2021-10-11 12:25:52'),
(136, 'default', 0, 'catalog/seo/title_separator', '-', '2021-07-27 12:47:37'),
(137, 'default', 0, 'catalog/seo/category_canonical_tag', '1', '2021-07-27 12:47:37'),
(138, 'default', 0, 'catalog/seo/product_canonical_tag', '1', '2021-07-27 12:47:37'),
(139, 'default', 0, 'catalog/navigation/max_depth', '0', '2021-07-27 12:47:37'),
(140, 'default', 0, 'catalog/search/min_query_length', '1', '2021-07-27 12:47:37'),
(141, 'default', 0, 'catalog/search/max_query_length', '128', '2021-07-27 12:47:37'),
(142, 'default', 0, 'catalog/search/max_query_words', '10', '2021-07-27 12:47:37'),
(143, 'default', 0, 'catalog/search/search_type', '2', '2021-07-27 12:47:37'),
(144, 'default', 0, 'catalog/search/use_layered_navigation_count', '2000', '2021-07-27 12:47:37'),
(145, 'default', 0, 'catalog/search/show_autocomplete_results_count', '1', '2021-07-27 12:47:37'),
(146, 'default', 0, 'catalog/downloadable/order_item_status', '9', '2021-07-27 12:47:37'),
(147, 'default', 0, 'catalog/downloadable/downloads_number', '0', '2021-07-27 12:47:37'),
(148, 'default', 0, 'catalog/downloadable/shareable', '0', '2021-07-27 12:47:37'),
(149, 'default', 0, 'catalog/downloadable/samples_title', 'Samples', '2021-07-27 12:47:37'),
(150, 'default', 0, 'catalog/downloadable/links_title', 'Links', '2021-07-27 12:47:37'),
(151, 'default', 0, 'catalog/downloadable/links_target_new_window', '1', '2021-07-27 12:47:37'),
(152, 'default', 0, 'catalog/downloadable/content_disposition', 'attachment', '2021-07-27 12:47:37'),
(153, 'default', 0, 'catalog/downloadable/disable_guest_checkout', '1', '2021-07-27 12:47:37'),
(154, 'default', 0, 'catalog/custom_options/use_calendar', '0', '2021-07-27 12:47:37'),
(155, 'default', 0, 'catalog/custom_options/date_fields_order', 'm,d,y', '2021-07-27 12:47:37'),
(156, 'default', 0, 'catalog/custom_options/time_format', '12h', '2021-07-27 12:47:37'),
(157, 'default', 0, 'catalog/custom_options/year_range', ',', '2021-07-27 12:47:37'),
(158, 'default', 0, 'catalog/frontend/flat_catalog_category', '0', '2021-07-30 04:09:45'),
(159, 'default', 0, 'catalog/frontend/flat_catalog_product', '0', '2021-07-30 04:09:45'),
(160, 'websites', 1, 'dev/debug/template_hints', '0', '2021-11-19 03:36:39'),
(161, 'websites', 1, 'dev/debug/template_hints_blocks', '0', '2021-08-02 10:55:00'),
(162, 'default', 0, 'easypathhints/option/active', '1', '2021-07-30 10:38:16'),
(163, 'default', 0, 'easypathhints/option/code', 'magento', '2021-07-30 10:38:08'),
(164, 'default', 0, 'easypathhints/option/cookie', '0', '2021-07-30 10:38:08'),
(166, 'stores', 1, 'design/head/title_suffix', ' | Game Commerce', '2021-07-30 13:11:43'),
(167, 'websites', 1, 'design/head/title_prefix', NULL, '2021-07-30 13:12:31'),
(168, 'websites', 1, 'design/head/title_suffix', ' ', '2021-07-30 13:12:45'),
(169, 'default', 0, 'web/url/use_store', '0', '2021-08-02 10:34:29'),
(170, 'default', 0, 'web/url/redirect_to_base', '1', '2021-08-02 10:34:30'),
(171, 'default', 0, 'web/seo/use_rewrites', '1', '2021-08-02 10:34:30'),
(172, 'default', 0, 'web/unsecure/base_link_url', '{{unsecure_base_url}}', '2021-08-02 10:34:30'),
(173, 'default', 0, 'web/unsecure/base_skin_url', '{{unsecure_base_url}}skin/', '2021-08-02 10:34:30'),
(174, 'default', 0, 'web/unsecure/base_media_url', '{{unsecure_base_url}}media/', '2021-08-02 10:34:30'),
(175, 'default', 0, 'web/unsecure/base_js_url', '{{unsecure_base_url}}js/', '2021-08-02 10:34:30'),
(176, 'default', 0, 'web/secure/base_link_url', '{{secure_base_url}}', '2021-08-02 10:34:30'),
(177, 'default', 0, 'web/secure/base_skin_url', '{{secure_base_url}}skin/', '2021-08-02 10:34:30'),
(178, 'default', 0, 'web/secure/base_media_url', '{{secure_base_url}}media/', '2021-08-02 10:34:30'),
(179, 'default', 0, 'web/secure/base_js_url', '{{secure_base_url}}js/', '2021-08-02 10:34:30'),
(180, 'default', 0, 'web/secure/use_in_frontend', '0', '2021-08-02 10:34:30'),
(181, 'default', 0, 'web/secure/use_in_adminhtml', '0', '2021-08-02 10:34:30'),
(182, 'default', 0, 'web/secure/offloader_header', 'SSL_OFFLOADED', '2021-08-02 10:34:30'),
(183, 'default', 0, 'web/default/front', 'cms', '2021-08-02 10:34:30'),
(184, 'default', 0, 'web/default/cms_home_page', 'index', '2021-11-18 13:31:47'),
(185, 'default', 0, 'web/default/no_route', 'cms/index/noRoute', '2021-08-02 10:34:30'),
(186, 'default', 0, 'web/default/cms_no_route', 'no-route', '2021-08-02 10:34:30'),
(187, 'default', 0, 'web/default/cms_no_cookies', 'enable-cookies', '2021-08-02 10:34:30'),
(188, 'default', 0, 'web/default/show_cms_breadcrumbs', '1', '2021-08-02 10:34:30'),
(189, 'default', 0, 'web/polls/poll_check_by_ip', '0', '2021-08-02 10:34:30'),
(190, 'default', 0, 'web/cookie/cookie_lifetime', '3600', '2021-08-02 10:34:30'),
(191, 'default', 0, 'web/cookie/cookie_path', NULL, '2021-08-02 10:34:30'),
(192, 'default', 0, 'web/cookie/cookie_domain', NULL, '2021-08-02 10:34:30'),
(193, 'default', 0, 'web/cookie/cookie_httponly', '1', '2021-08-02 10:34:30'),
(194, 'default', 0, 'web/cookie/cookie_restriction', '0', '2021-08-02 10:34:30'),
(195, 'default', 0, 'web/session/use_remote_addr', '0', '2021-08-02 10:34:30'),
(196, 'default', 0, 'web/session/use_http_via', '0', '2021-08-02 10:34:30'),
(197, 'default', 0, 'web/session/use_http_x_forwarded_for', '0', '2021-08-02 10:34:30'),
(198, 'default', 0, 'web/session/use_http_user_agent', '0', '2021-08-02 10:34:30'),
(199, 'default', 0, 'web/session/use_frontend_sid', '1', '2021-08-02 10:34:30'),
(200, 'default', 0, 'web/browser_capabilities/cookies', '1', '2021-08-02 10:34:30'),
(201, 'default', 0, 'web/browser_capabilities/javascript', '1', '2021-08-02 10:34:30'),
(203, 'default', 0, 'cms/wysiwyg/enabled', 'disabled', '2021-09-09 07:35:56'),
(204, 'default', 0, 'cms/wysiwyg/use_static_urls_in_catalog', '0', '2021-09-09 07:35:42'),
(205, 'default', 0, 'admin/emails/forgot_email_template', 'admin_emails_forgot_email_template', '2021-09-09 13:51:37'),
(206, 'default', 0, 'admin/emails/forgot_email_identity', 'general', '2021-09-09 13:51:37'),
(207, 'default', 0, 'admin/emails/password_reset_link_expiration_period', '2', '2021-09-09 13:51:37'),
(208, 'default', 0, 'admin/startup/page', 'dashboard', '2021-09-09 13:51:37'),
(209, 'default', 0, 'admin/url/use_custom', '0', '2021-09-09 13:51:37'),
(210, 'default', 0, 'admin/url/use_custom_path', '0', '2021-09-09 13:51:37'),
(211, 'default', 0, 'admin/security/use_form_key', '1', '2021-09-09 13:51:37'),
(212, 'default', 0, 'admin/security/use_case_sensitive_login', '0', '2021-09-09 13:51:38'),
(213, 'default', 0, 'admin/security/session_cookie_lifetime', '7200', '2021-09-09 13:51:38'),
(214, 'default', 0, 'admin/security/domain_policy_backend', '2', '2021-09-09 13:51:38'),
(215, 'default', 0, 'admin/security/validate_formkey_checkout', '0', '2021-09-09 13:51:38'),
(216, 'default', 0, 'admin/security/domain_policy_frontend', '2', '2021-09-09 13:51:38'),
(217, 'default', 0, 'admin/security/extensions_compatibility_mode', '1', '2021-09-09 13:51:38'),
(218, 'default', 0, 'admin/security/crate_admin_user_notification', '0', '2021-09-09 13:51:38'),
(219, 'default', 0, 'admin/security/forgot_password_flow_secure', '1', '2021-09-09 13:51:38'),
(220, 'default', 0, 'admin/security/forgot_password_ip_times', '5', '2021-09-09 13:51:38'),
(221, 'default', 0, 'admin/security/forgot_password_email_times', '5', '2021-09-09 13:51:38'),
(222, 'default', 0, 'admin/security/min_admin_password_length', '14', '2021-09-09 13:51:38'),
(223, 'default', 0, 'admin/captcha/enable', '0', '2021-09-09 13:51:38'),
(225, 'websites', 1, 'design/pagination/pagination_frame', NULL, '2021-09-10 11:49:06'),
(226, 'websites', 1, 'design/pagination/anchor_text_for_previous', ' ', '2021-09-10 11:55:16'),
(227, 'websites', 1, 'design/pagination/anchor_text_for_next', ' ', '2021-09-10 11:55:16'),
(228, 'websites', 1, 'design/pagination/pagination_frame_skip', NULL, '2021-09-10 11:56:25'),
(231, 'websites', 1, 'design/footer/copyright', '&copy; 2021 gameCommerce. All Rights Reserved.', '2021-09-27 07:26:35'),
(232, 'websites', 1, 'newsletter/subscription/allow_guest_subscribe', '0', '2021-11-18 14:24:56'),
(233, 'websites', 1, 'design/package/name', 'GameCommerce Theme', '2021-11-19 02:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `core_email_queue`
--

CREATE TABLE `core_email_queue` (
  `message_id` int(10) UNSIGNED NOT NULL COMMENT 'Message Id',
  `entity_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Entity ID',
  `entity_type` varchar(128) DEFAULT NULL COMMENT 'Entity Type',
  `event_type` varchar(128) DEFAULT NULL COMMENT 'Event Type',
  `message_body_hash` varchar(64) NOT NULL COMMENT 'Message Body Hash',
  `message_body` mediumtext NOT NULL COMMENT 'Message Body',
  `message_parameters` text NOT NULL COMMENT 'Message Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `processed_at` timestamp NULL DEFAULT NULL COMMENT 'Finish Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Queue';

--
-- Dumping data for table `core_email_queue`
--

INSERT INTO `core_email_queue` (`message_id`, `entity_id`, `entity_type`, `event_type`, `message_body_hash`, `message_body`, `message_parameters`, `created_at`, `processed_at`) VALUES
(1, 1, 'order', 'new_order', 'b989198222cc4474cb13b4c528f41fae', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" style=\"background-color: #ebebeb;\">\n<head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta name=\"viewport\" content=\"initial-scale=1.0, width=device-width\">\n</head>\n<body style=\"font-family: Verdana, Arial; font-weight: normal; margin: 0; padding: 0; text-align: left; color: #333333; background-color: #ebebeb; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; background: #ebebeb; font-size: 12px;\">\n<style type=\"text/css\">\n/**\n * Magento\n *\n * NOTICE OF LICENSE\n *\n * This source file is subject to the Academic Free License (AFL 3.0)\n * that is bundled with this package in the file LICENSE_AFL.txt.\n * It is also available through the world-wide-web at this URL:\n * http://opensource.org/licenses/afl-3.0.php\n * If you did not receive a copy of the license and are unable to\n * obtain it through the world-wide-web, please send an email\n * to license@magento.com so we can send you a copy immediately.\n *\n * DISCLAIMER\n *\n * Do not edit or add to this file if you wish to upgrade Magento to newer\n * versions in the future. If you wish to customize Magento for your\n * needs please refer to http://www.magento.com for more information.\n *\n * @category    design\n * @package     base_default\n * @copyright   Copyright (c) 2006-2020 Magento, Inc. (http://www.magento.com)\n * @license     http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)\n */\n@import url(http://fonts.googleapis.com/css?family=Raleway:400,500,700);\n/* Font Styles */\n/* Media Queries */\n/* Setting the Web Font inside a media query so that Outlook doesn\'t try to render the web font */\n@media screen {\n  .email-heading h1,\n  .store-info h4,\n  th.cell-name,\n  a.product-name,\n  p.product-name,\n  .address-details h6,\n  .method-info h6,\n  h5.closing-text,\n  .action-button,\n  .action-button a,\n  .action-button span,\n  .action-content h1 {\n    font-family: \'Raleway\', Verdana, Arial !important;\n    font-weight: normal;\n  }\n}\n@media screen and (max-width: 600px) {\n  body {\n    width: 94% !important;\n    padding: 0 3% !important;\n    display: block !important;\n  }\n\n  .container-table {\n    width: 100% !important;\n    max-width: 600px;\n    min-width: 300px;\n  }\n\n  td.store-info h4 {\n    margin-top: 8px !important;\n    margin-bottom: 0px !important;\n  }\n\n  td.store-info p {\n    margin: 5px 0 !important;\n  }\n\n  .wrapper {\n    width: 100% !important;\n    display: block;\n    padding: 5px 0 !important;\n  }\n\n  .cell-name,\n  .cell-content {\n    padding: 8px !important;\n  }\n}\n@media screen and (max-width: 450px) {\n  .email-heading,\n  .store-info {\n    float: left;\n    width: 98% !important;\n    display: block;\n    text-align: center;\n    padding: 10px 1% !important;\n    border-right: 0px !important;\n  }\n\n  .address-details, .method-info {\n    width: 85%;\n    display: block;\n  }\n\n  .store-info {\n    border-top: 1px dashed #c3ced4;\n  }\n\n  .method-info {\n    margin-bottom: 15px !important;\n  }\n}\n/* Remove link color on iOS */\n.no-link a {\n  color: #333333 !important;\n  cursor: default !important;\n  text-decoration: none !important;\n}\n\n.method-info h6,\n.address-details h6,\n.closing-text {\n  color: #3696c2 !important;\n}\n\ntd.order-details h3,\ntd.store-info h4 {\n  color: #333333 !important;\n}\n\n.method-info p,\n.method-info dl {\n  margin: 5px 0 !important;\n  font-size: 12px !important;\n}\n\ntd.align-center {\n  text-align: center !important;\n}\n\ntd.align-right {\n  text-align: right !important;\n}\n\n/* Newsletter styles */\ntd.expander {\n  padding: 0 !important;\n}\n\ntable.button td,\ntable.social-button td {\n  width: 92% !important;\n}\n\ntable.facebook:hover td {\n  background: #2d4473 !important;\n}\n\ntable.twitter:hover td {\n  background: #0087bb !important;\n}\n\ntable.google-plus:hover td {\n  background: #CC0000 !important;\n}\n\n/* ============================================ *\n * Product Grid\n * ============================================ */\n@media screen and (max-width: 600px) {\n  .products-grid tr td {\n    width: 50% !important;\n    display: block !important;\n    float: left !important;\n  }\n}\n.product-name a:hover {\n  color: #3399cc !important;\n  text-decoration: none !important;\n}\n\n\n</style>\n\n<!-- Begin wrapper table -->\n<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" id=\"background-table\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0 auto; background-color: #ebebeb; font-size: 12px;\">\n    <tr>\n        <td valign=\"top\" class=\"container-td\" align=\"center\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0; width: 100%;\">\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" class=\"container-table\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0 auto; width: 600px;\">\n                <tr>\n                    <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n                        <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"logo-container\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%;\">\n                            <tr>\n                                <td class=\"logo\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 15px 0px 10px 5px; margin: 0;\">\n                                    <a href=\"http://127.0.0.1/magento-mirror-magento-1.9/index.php/\" style=\"color: #3696c2; float: left; display: block;\">\n                                        <img width=\"165\" height=\"48\" src=\"http://127.0.0.1/magento-mirror-magento-1.9/skin/frontend/iTemplate/default/images/logo_email.gif\" alt=\"Game Commerce\" border=\"0\" style=\"-ms-interpolation-mode: bicubic; outline: none; text-decoration: none;\">\n                                    </a>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td valign=\"top\" class=\"top-content\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 5px; margin: 0; border: 1px solid #ebebeb; background: #FFF;\">\n                    <!-- Begin Content -->\n\n\n\n<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%;\">\n    <tr>\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0;\">\n                <tr>\n                    <td class=\"email-heading\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0 1%; margin: 0; background: #e1f0f8; border-right: 1px dashed #c3ced4; text-align: center; width: 58%;\">\n                        <h1 style=\"font-family: Verdana, Arial; font-weight: 700; font-size: 16px; margin: 1em 0; line-height: 20px; text-transform: uppercase; margin-top: 25px;\">Thank you for your order from Game Commerce.</h1>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; line-height: 20px; margin: 1em 0;\">Once your package ships we will send an email with a link to track your order. Your order summary is below. Thank you again for your business.</p>\n                    </td>\n                    <td class=\"store-info\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 2%; margin: 0; background: #e1f0f8; width: 40%;\">\n                        <h4 style=\"font-family: Verdana, Arial; font-weight: bold; margin-bottom: 5px; font-size: 12px; margin-top: 13px;\">Order Questions?</h4>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 11px; line-height: 17px; margin: 1em 0;\">\n                            \n                            \n                            \n                            <b>Email:</b> <a href=\"mailto:support@example.com\" style=\"color: #3696c2; text-decoration: underline;\">support@example.com</a>\n                            \n                        </p>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n    <tr>\n        <td class=\"order-details\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 5px 15px; margin: 0; text-align: center;\">\n            <h3 style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 17px; margin-bottom: 10px; margin-top: 15px;\">Your order <span class=\"no-link\">#100000001</span>\n</h3>\n            <p style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 11px; margin: 1em 0 15px;\">Placed on August 2, 2021 2:16:29 PM PST</p>\n        </td>\n    </tr>\n    <tr class=\"order-information\">\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            \n            \n\n            </td>\n</tr>\n<tr>\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            <table class=\"items\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 10px 15px; margin: 0; width: 100%;\">\n                <thead>\n                    <tr>\n                        <th class=\"cell-name\" style=\"font-family: Verdana, Arial; font-weight: 700; padding: 10px 15px; background: #f1f1f1; text-transform: uppercase; text-align: left; font-size: 11px;\">\n                                                            Item in your order                                                    </th>\n                        <th class=\"cell-name align-center\" style=\"font-family: Verdana, Arial; font-weight: 700; padding: 10px 15px; background: #f1f1f1; text-transform: uppercase; text-align: center; font-size: 11px;\">\n                            Qty                        </th>\n                        <th class=\"cell-name align-right\" style=\"font-family: Verdana, Arial; font-weight: 700; padding: 10px 15px; background: #f1f1f1; text-transform: uppercase; text-align: right; font-size: 11px;\">\n                            Price                        </th>\n                    </tr>\n                </thead>\n                                        <tbody>\n    <tr>\n        <td class=\"cell-content product-info\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px; margin: 0; border-top: 1px solid #ebebeb; text-align: left;\">\n        <p class=\"product-name\" style=\"font-family: Verdana, Arial; font-weight: bold; margin: 0 0 5px 0; color: #636363; font-style: normal; text-rendering: optimizeLegibility; text-transform: uppercase; line-height: 1.4; font-size: 14px; float: left; width: 100%; display: block;\">Steam</p>\n        <p class=\"sku\" style=\"font-family: Verdana, Arial; font-weight: normal; margin: 0 0 5px; float: left; width: 100%; display: block;\">SKU: 546</p>\n                                                                                                            </td>\n            <td class=\"cell-content align-center\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px; margin: 0; border-top: 1px solid #ebebeb;\">1</td>\n            <td class=\"cell-content align-right\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px; margin: 0; border-top: 1px solid #ebebeb;\">\n                                                                                <span class=\"price\" style=\'font-family: \"Helvetica Neue\", Verdana, Arial, sans-serif;\'>???234.00</span>                    \n\n                                    \n\n                            </td>\n        </tr>\n    </tbody>\n                        </table>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            <table class=\"table-totals\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%; background: #e1f0f8;\">\n    <tr>\n        <td class=\"padding-totals\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 20px 15px; margin: 0; text-align: right; line-height: 20px;\">\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%;\">\n                        <tr class=\"subtotal\">\n        <td colspan=\"3\" align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        Subtotal                    </td>\n        <td align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        <span class=\"price\" style=\'font-family: \"Helvetica Neue\", Verdana, Arial, sans-serif;\'>???234.00</span>                    </td>\n    </tr>\n            <tr class=\"grand_total\">\n        <td colspan=\"3\" align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        <strong style=\"font-family: Verdana, Arial; font-weight: normal;\">Grand Total</strong>\n                    </td>\n        <td align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        <strong style=\"font-family: Verdana, Arial; font-weight: normal;\"><span class=\"price\" style=\'font-family: \"Helvetica Neue\", Verdana, Arial, sans-serif;\'>???234.00</span></strong>\n                    </td>\n    </tr>\n                </table>\n        </td>\n    </tr>\n</table>\n        </td>\n    </tr>\n    \n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0;\">\n                <tr>\n                    <td class=\"address-details\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px 0; margin: 0; padding-top: 10px; text-align: left;\">\n                        <h6 style=\"font-family: Verdana, Arial; font-weight: 700; font-size: 12px; margin-bottom: 0px; margin-top: 5px; text-transform: uppercase;\">Bill to:</h6>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 12px; line-height: 18px; margin-bottom: 15px; margin-top: 2px;\"><span class=\"no-link\">df df df<br>\n\n23<br>\neas<br>\n\n\nsad,  1116<br>\nPhilippines<br>\nT: 123123\n\n</span></p>\n                    </td>\n                    \n                </tr>\n                <tr>\n                    \n                    <td class=\"method-info\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px 0; margin: 0; text-align: left; padding-bottom: 10px;\">\n                        <h6 style=\"font-family: Verdana, Arial; font-weight: 700; text-align: left; font-size: 12px; margin-bottom: 0px; margin-top: 5px; text-transform: uppercase;\">Payment method:</h6>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; text-align: left; font-size: 12px; margin-top: 2px; margin-bottom: 30px; line-height: 18px; padding: 0;\">Check / Money order</p>\n\n                    </td>\n                </tr>\n            </table>\n        \n    \n</table>\n\n\n                    <!-- End Content -->\n                    </td>\n                </tr>\n            </table>\n            <h5 class=\"closing-text\" style=\"font-family: Verdana, Arial; font-weight: normal; text-align: center; font-size: 22px; line-height: 32px; margin-bottom: 75px; margin-top: 30px;\">Thank you, Game Commerce!</h5>\n        </td>\n    </tr>\n</table>\n<!-- End wrapper table -->\n</body>\n\n</html>\n', 'a:7:{s:7:\"subject\";s:36:\"Game Commerce: New Order # 100000001\";s:17:\"return_path_email\";N;s:8:\"is_plain\";b:0;s:10:\"from_email\";s:17:\"sales@example.com\";s:9:\"from_name\";s:5:\"Sales\";s:8:\"reply_to\";N;s:9:\"return_to\";N;}', '2021-08-01 22:16:29', NULL),
(2, 1, 'order', 'new_order', 'b989198222cc4474cb13b4c528f41fae', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" style=\"background-color: #ebebeb;\">\n<head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta name=\"viewport\" content=\"initial-scale=1.0, width=device-width\">\n</head>\n<body style=\"font-family: Verdana, Arial; font-weight: normal; margin: 0; padding: 0; text-align: left; color: #333333; background-color: #ebebeb; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; background: #ebebeb; font-size: 12px;\">\n<style type=\"text/css\">\n/**\n * Magento\n *\n * NOTICE OF LICENSE\n *\n * This source file is subject to the Academic Free License (AFL 3.0)\n * that is bundled with this package in the file LICENSE_AFL.txt.\n * It is also available through the world-wide-web at this URL:\n * http://opensource.org/licenses/afl-3.0.php\n * If you did not receive a copy of the license and are unable to\n * obtain it through the world-wide-web, please send an email\n * to license@magento.com so we can send you a copy immediately.\n *\n * DISCLAIMER\n *\n * Do not edit or add to this file if you wish to upgrade Magento to newer\n * versions in the future. If you wish to customize Magento for your\n * needs please refer to http://www.magento.com for more information.\n *\n * @category    design\n * @package     base_default\n * @copyright   Copyright (c) 2006-2020 Magento, Inc. (http://www.magento.com)\n * @license     http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)\n */\n@import url(http://fonts.googleapis.com/css?family=Raleway:400,500,700);\n/* Font Styles */\n/* Media Queries */\n/* Setting the Web Font inside a media query so that Outlook doesn\'t try to render the web font */\n@media screen {\n  .email-heading h1,\n  .store-info h4,\n  th.cell-name,\n  a.product-name,\n  p.product-name,\n  .address-details h6,\n  .method-info h6,\n  h5.closing-text,\n  .action-button,\n  .action-button a,\n  .action-button span,\n  .action-content h1 {\n    font-family: \'Raleway\', Verdana, Arial !important;\n    font-weight: normal;\n  }\n}\n@media screen and (max-width: 600px) {\n  body {\n    width: 94% !important;\n    padding: 0 3% !important;\n    display: block !important;\n  }\n\n  .container-table {\n    width: 100% !important;\n    max-width: 600px;\n    min-width: 300px;\n  }\n\n  td.store-info h4 {\n    margin-top: 8px !important;\n    margin-bottom: 0px !important;\n  }\n\n  td.store-info p {\n    margin: 5px 0 !important;\n  }\n\n  .wrapper {\n    width: 100% !important;\n    display: block;\n    padding: 5px 0 !important;\n  }\n\n  .cell-name,\n  .cell-content {\n    padding: 8px !important;\n  }\n}\n@media screen and (max-width: 450px) {\n  .email-heading,\n  .store-info {\n    float: left;\n    width: 98% !important;\n    display: block;\n    text-align: center;\n    padding: 10px 1% !important;\n    border-right: 0px !important;\n  }\n\n  .address-details, .method-info {\n    width: 85%;\n    display: block;\n  }\n\n  .store-info {\n    border-top: 1px dashed #c3ced4;\n  }\n\n  .method-info {\n    margin-bottom: 15px !important;\n  }\n}\n/* Remove link color on iOS */\n.no-link a {\n  color: #333333 !important;\n  cursor: default !important;\n  text-decoration: none !important;\n}\n\n.method-info h6,\n.address-details h6,\n.closing-text {\n  color: #3696c2 !important;\n}\n\ntd.order-details h3,\ntd.store-info h4 {\n  color: #333333 !important;\n}\n\n.method-info p,\n.method-info dl {\n  margin: 5px 0 !important;\n  font-size: 12px !important;\n}\n\ntd.align-center {\n  text-align: center !important;\n}\n\ntd.align-right {\n  text-align: right !important;\n}\n\n/* Newsletter styles */\ntd.expander {\n  padding: 0 !important;\n}\n\ntable.button td,\ntable.social-button td {\n  width: 92% !important;\n}\n\ntable.facebook:hover td {\n  background: #2d4473 !important;\n}\n\ntable.twitter:hover td {\n  background: #0087bb !important;\n}\n\ntable.google-plus:hover td {\n  background: #CC0000 !important;\n}\n\n/* ============================================ *\n * Product Grid\n * ============================================ */\n@media screen and (max-width: 600px) {\n  .products-grid tr td {\n    width: 50% !important;\n    display: block !important;\n    float: left !important;\n  }\n}\n.product-name a:hover {\n  color: #3399cc !important;\n  text-decoration: none !important;\n}\n\n\n</style>\n\n<!-- Begin wrapper table -->\n<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" id=\"background-table\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0 auto; background-color: #ebebeb; font-size: 12px;\">\n    <tr>\n        <td valign=\"top\" class=\"container-td\" align=\"center\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0; width: 100%;\">\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" class=\"container-table\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0 auto; width: 600px;\">\n                <tr>\n                    <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n                        <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"logo-container\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%;\">\n                            <tr>\n                                <td class=\"logo\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 15px 0px 10px 5px; margin: 0;\">\n                                    <a href=\"http://127.0.0.1/magento-mirror-magento-1.9/index.php/\" style=\"color: #3696c2; float: left; display: block;\">\n                                        <img width=\"165\" height=\"48\" src=\"http://127.0.0.1/magento-mirror-magento-1.9/skin/frontend/iTemplate/default/images/logo_email.gif\" alt=\"Game Commerce\" border=\"0\" style=\"-ms-interpolation-mode: bicubic; outline: none; text-decoration: none;\">\n                                    </a>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td valign=\"top\" class=\"top-content\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 5px; margin: 0; border: 1px solid #ebebeb; background: #FFF;\">\n                    <!-- Begin Content -->\n\n\n\n<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%;\">\n    <tr>\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0;\">\n                <tr>\n                    <td class=\"email-heading\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0 1%; margin: 0; background: #e1f0f8; border-right: 1px dashed #c3ced4; text-align: center; width: 58%;\">\n                        <h1 style=\"font-family: Verdana, Arial; font-weight: 700; font-size: 16px; margin: 1em 0; line-height: 20px; text-transform: uppercase; margin-top: 25px;\">Thank you for your order from Game Commerce.</h1>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; line-height: 20px; margin: 1em 0;\">Once your package ships we will send an email with a link to track your order. Your order summary is below. Thank you again for your business.</p>\n                    </td>\n                    <td class=\"store-info\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 2%; margin: 0; background: #e1f0f8; width: 40%;\">\n                        <h4 style=\"font-family: Verdana, Arial; font-weight: bold; margin-bottom: 5px; font-size: 12px; margin-top: 13px;\">Order Questions?</h4>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 11px; line-height: 17px; margin: 1em 0;\">\n                            \n                            \n                            \n                            <b>Email:</b> <a href=\"mailto:support@example.com\" style=\"color: #3696c2; text-decoration: underline;\">support@example.com</a>\n                            \n                        </p>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n    <tr>\n        <td class=\"order-details\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 5px 15px; margin: 0; text-align: center;\">\n            <h3 style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 17px; margin-bottom: 10px; margin-top: 15px;\">Your order <span class=\"no-link\">#100000001</span>\n</h3>\n            <p style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 11px; margin: 1em 0 15px;\">Placed on August 2, 2021 2:16:29 PM PST</p>\n        </td>\n    </tr>\n    <tr class=\"order-information\">\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            \n            \n\n            </td>\n</tr>\n<tr>\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            <table class=\"items\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 10px 15px; margin: 0; width: 100%;\">\n                <thead>\n                    <tr>\n                        <th class=\"cell-name\" style=\"font-family: Verdana, Arial; font-weight: 700; padding: 10px 15px; background: #f1f1f1; text-transform: uppercase; text-align: left; font-size: 11px;\">\n                                                            Item in your order                                                    </th>\n                        <th class=\"cell-name align-center\" style=\"font-family: Verdana, Arial; font-weight: 700; padding: 10px 15px; background: #f1f1f1; text-transform: uppercase; text-align: center; font-size: 11px;\">\n                            Qty                        </th>\n                        <th class=\"cell-name align-right\" style=\"font-family: Verdana, Arial; font-weight: 700; padding: 10px 15px; background: #f1f1f1; text-transform: uppercase; text-align: right; font-size: 11px;\">\n                            Price                        </th>\n                    </tr>\n                </thead>\n                                        <tbody>\n    <tr>\n        <td class=\"cell-content product-info\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px; margin: 0; border-top: 1px solid #ebebeb; text-align: left;\">\n        <p class=\"product-name\" style=\"font-family: Verdana, Arial; font-weight: bold; margin: 0 0 5px 0; color: #636363; font-style: normal; text-rendering: optimizeLegibility; text-transform: uppercase; line-height: 1.4; font-size: 14px; float: left; width: 100%; display: block;\">Steam</p>\n        <p class=\"sku\" style=\"font-family: Verdana, Arial; font-weight: normal; margin: 0 0 5px; float: left; width: 100%; display: block;\">SKU: 546</p>\n                                                                                                            </td>\n            <td class=\"cell-content align-center\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px; margin: 0; border-top: 1px solid #ebebeb;\">1</td>\n            <td class=\"cell-content align-right\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px; margin: 0; border-top: 1px solid #ebebeb;\">\n                                                                                <span class=\"price\" style=\'font-family: \"Helvetica Neue\", Verdana, Arial, sans-serif;\'>???234.00</span>                    \n\n                                    \n\n                            </td>\n        </tr>\n    </tbody>\n                        </table>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 0; margin: 0;\">\n            <table class=\"table-totals\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%; background: #e1f0f8;\">\n    <tr>\n        <td class=\"padding-totals\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 20px 15px; margin: 0; text-align: right; line-height: 20px;\">\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0; width: 100%;\">\n                        <tr class=\"subtotal\">\n        <td colspan=\"3\" align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        Subtotal                    </td>\n        <td align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        <span class=\"price\" style=\'font-family: \"Helvetica Neue\", Verdana, Arial, sans-serif;\'>???234.00</span>                    </td>\n    </tr>\n            <tr class=\"grand_total\">\n        <td colspan=\"3\" align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        <strong style=\"font-family: Verdana, Arial; font-weight: normal;\">Grand Total</strong>\n                    </td>\n        <td align=\"right\" style=\"padding: 3px 9px; font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; margin: 0;\">\n                        <strong style=\"font-family: Verdana, Arial; font-weight: normal;\"><span class=\"price\" style=\'font-family: \"Helvetica Neue\", Verdana, Arial, sans-serif;\'>???234.00</span></strong>\n                    </td>\n    </tr>\n                </table>\n        </td>\n    </tr>\n</table>\n        </td>\n    </tr>\n    \n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; padding: 0; margin: 0;\">\n                <tr>\n                    <td class=\"address-details\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px 0; margin: 0; padding-top: 10px; text-align: left;\">\n                        <h6 style=\"font-family: Verdana, Arial; font-weight: 700; font-size: 12px; margin-bottom: 0px; margin-top: 5px; text-transform: uppercase;\">Bill to:</h6>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; font-size: 12px; line-height: 18px; margin-bottom: 15px; margin-top: 2px;\"><span class=\"no-link\">df df df<br>\n\n23<br>\neas<br>\n\n\nsad,  1116<br>\nPhilippines<br>\nT: 123123\n\n</span></p>\n                    </td>\n                    \n                </tr>\n                <tr>\n                    \n                    <td class=\"method-info\" style=\"font-family: Verdana, Arial; font-weight: normal; border-collapse: collapse; vertical-align: top; padding: 10px 15px 0; margin: 0; text-align: left; padding-bottom: 10px;\">\n                        <h6 style=\"font-family: Verdana, Arial; font-weight: 700; text-align: left; font-size: 12px; margin-bottom: 0px; margin-top: 5px; text-transform: uppercase;\">Payment method:</h6>\n                        <p style=\"font-family: Verdana, Arial; font-weight: normal; text-align: left; font-size: 12px; margin-top: 2px; margin-bottom: 30px; line-height: 18px; padding: 0;\">Check / Money order</p>\n\n                    </td>\n                </tr>\n            </table>\n        \n    \n</table>\n\n\n                    <!-- End Content -->\n                    </td>\n                </tr>\n            </table>\n            <h5 class=\"closing-text\" style=\"font-family: Verdana, Arial; font-weight: normal; text-align: center; font-size: 22px; line-height: 32px; margin-bottom: 75px; margin-top: 30px;\">Thank you, Game Commerce!</h5>\n        </td>\n    </tr>\n</table>\n<!-- End wrapper table -->\n</body>\n\n</html>\n', 'a:7:{s:7:\"subject\";s:36:\"Game Commerce: New Order # 100000001\";s:17:\"return_path_email\";N;s:8:\"is_plain\";b:0;s:10:\"from_email\";s:17:\"sales@example.com\";s:9:\"from_name\";s:5:\"Sales\";s:8:\"reply_to\";N;s:9:\"return_to\";N;}', '2021-08-01 22:19:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_email_queue_recipients`
--

CREATE TABLE `core_email_queue_recipients` (
  `recipient_id` int(10) UNSIGNED NOT NULL COMMENT 'Recipient Id',
  `message_id` int(10) UNSIGNED NOT NULL COMMENT 'Message ID',
  `recipient_email` varchar(128) NOT NULL COMMENT 'Recipient Email',
  `recipient_name` varchar(255) NOT NULL COMMENT 'Recipient Name',
  `email_type` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Email Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Queue';

--
-- Dumping data for table `core_email_queue_recipients`
--

INSERT INTO `core_email_queue_recipients` (`recipient_id`, `message_id`, `recipient_email`, `recipient_name`, `email_type`) VALUES
(1, 1, 'ivargasrodel@gmail.com', 'df df df', 0),
(2, 2, 'ivargasrodel@gmail.com', 'df df df', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_email_template`
--

CREATE TABLE `core_email_template` (
  `template_id` int(10) UNSIGNED NOT NULL COMMENT 'Template Id',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text DEFAULT NULL COMMENT 'Templste Styles',
  `template_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text DEFAULT NULL COMMENT 'Original Template Variables'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';

-- --------------------------------------------------------

--
-- Table structure for table `core_flag`
--

CREATE TABLE `core_flag` (
  `flag_id` int(10) UNSIGNED NOT NULL COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Flag State',
  `flag_data` text DEFAULT NULL COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of Last Flag Update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag';

--
-- Dumping data for table `core_flag`
--

INSERT INTO `core_flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'admin_notification_survey', 0, 'a:1:{s:13:\"survey_viewed\";b:1;}', '2021-07-26 01:30:26'),
(2, 'catalog_product_flat', 0, 'a:2:{s:8:\"is_built\";b:1;s:16:\"is_store_built_1\";b:1;}', '2021-07-27 05:09:32'),
(3, 'catalog_rules_dirty', 0, NULL, '2021-09-09 21:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `core_layout_link`
--

CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `area` varchar(64) DEFAULT NULL COMMENT 'Area',
  `package` varchar(64) DEFAULT NULL COMMENT 'Package',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `layout_update_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Layout Update Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';

-- --------------------------------------------------------

--
-- Table structure for table `core_layout_update`
--

CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) UNSIGNED NOT NULL COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text DEFAULT NULL COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';

-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL COMMENT 'Resource Code',
  `version` varchar(50) DEFAULT NULL COMMENT 'Resource Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resources';

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES
('adminnotification_setup', '1.6.0.0', '1.6.0.0'),
('admin_setup', '1.6.1.3', '1.6.1.3'),
('api2_setup', '1.0.0.0', '1.0.0.0'),
('api_setup', '1.6.0.2', '1.6.0.2'),
('bundle_setup', '1.6.0.0.1', '1.6.0.0.1'),
('captcha_setup', '1.7.0.0.0', '1.7.0.0.0'),
('catalogindex_setup', '1.6.0.0', '1.6.0.0'),
('cataloginventory_setup', '1.6.0.0.2', '1.6.0.0.2'),
('catalogrule_setup', '1.6.0.3', '1.6.0.3'),
('catalogsearch_setup', '1.8.2.0', '1.8.2.0'),
('catalog_setup', '1.6.0.0.19.1.6', '1.6.0.0.19.1.6'),
('checkout_setup', '1.6.0.0', '1.6.0.0'),
('cms_setup', '1.6.0.0.2', '1.6.0.0.2'),
('compiler_setup', '1.6.0.0', '1.6.0.0'),
('contacts_setup', '1.6.0.0', '1.6.0.0'),
('core_setup', '1.6.0.10', '1.6.0.10'),
('cron_setup', '1.6.0.0', '1.6.0.0'),
('customer_setup', '1.6.2.0.7', '1.6.2.0.7'),
('dataflow_setup', '1.6.0.0', '1.6.0.0'),
('directory_setup', '1.6.0.3', '1.6.0.3'),
('downloadable_setup', '1.6.0.0.3', '1.6.0.0.3'),
('eav_setup', '1.6.0.1', '1.6.0.1'),
('giftmessage_setup', '1.6.0.0', '1.6.0.0'),
('googleanalytics_setup', '1.6.0.0', '1.6.0.0'),
('importexport_setup', '1.6.0.2', '1.6.0.2'),
('index_setup', '1.6.0.0', '1.6.0.0'),
('log_setup', '1.6.1.1', '1.6.1.1'),
('moneybookers_setup', '1.6.0.0', '1.6.0.0'),
('newsletter_setup', '1.6.0.2', '1.6.0.2'),
('oauth_setup', '1.0.0.0', '1.0.0.0'),
('paygate_setup', '1.6.0.0', '1.6.0.0'),
('payment_setup', '1.6.0.1', '1.6.0.1'),
('paypaluk_setup', '1.6.0.0', '1.6.0.0'),
('paypal_setup', '1.6.0.6', '1.6.0.6'),
('persistent_setup', '1.0.0.0', '1.0.0.0'),
('poll_setup', '1.6.0.1', '1.6.0.1'),
('productalert_setup', '1.6.0.0', '1.6.0.0'),
('rating_setup', '1.6.0.1', '1.6.0.1'),
('reports_setup', '1.6.0.0.1', '1.6.0.0.1'),
('review_setup', '1.6.0.0', '1.6.0.0'),
('rss_setup', '1.6.0.0', '1.6.0.0'),
('salesrule_setup', '1.6.0.3', '1.6.0.3'),
('sales_setup', '1.6.0.10', '1.6.0.10'),
('sendfriend_setup', '1.6.0.1', '1.6.0.1'),
('shipping_setup', '1.6.0.0', '1.6.0.0'),
('sitemap_setup', '1.6.0.0', '1.6.0.0'),
('tag_setup', '1.6.0.0', '1.6.0.0'),
('tax_setup', '1.6.0.4', '1.6.0.4'),
('usa_setup', '1.6.0.3', '1.6.0.3'),
('weee_setup', '1.6.0.0', '1.6.0.0'),
('widget_setup', '1.6.0.0', '1.6.0.0'),
('wishlist_setup', '1.6.0.0', '1.6.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `core_session`
--

CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

-- --------------------------------------------------------

--
-- Table structure for table `core_store`
--

CREATE TABLE `core_store` (
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Sort Order',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores';

--
-- Dumping data for table `core_store`
--

INSERT INTO `core_store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_store_group`
--

CREATE TABLE `core_store_group` (
  `group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Root Category Id',
  `default_store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Default Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store Groups';

--
-- Dumping data for table `core_store_group`
--

INSERT INTO `core_store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES
(0, 0, 'Default', 0, 0),
(1, 1, 'Main Website Store', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_translate`
--

CREATE TABLE `core_translate` (
  `key_id` int(10) UNSIGNED NOT NULL COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT 1591228201 COMMENT 'Translation String CRC32 Hash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';

-- --------------------------------------------------------

--
-- Table structure for table `core_url_rewrite`
--

CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) UNSIGNED NOT NULL COMMENT 'Rewrite Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `id_path` varchar(255) DEFAULT NULL COMMENT 'Id Path',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `is_system` smallint(5) UNSIGNED DEFAULT 1 COMMENT 'Defines is Rewrite System',
  `options` varchar(255) DEFAULT NULL COMMENT 'Options',
  `description` varchar(255) DEFAULT NULL COMMENT 'Deascription',
  `category_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Category Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';

--
-- Dumping data for table `core_url_rewrite`
--

INSERT INTO `core_url_rewrite` (`url_rewrite_id`, `store_id`, `id_path`, `request_path`, `target_path`, `is_system`, `options`, `description`, `category_id`, `product_id`) VALUES
(1, 1, 'product/15/12', 'indie/little-nightmares-2', 'catalog/product/view/id/15/category/12', 0, NULL, NULL, 12, 15),
(2, 1, 'category/10', 'jrpg', 'catalog/category/view/id/10', 1, NULL, NULL, 10, NULL),
(3, 1, 'category/12', 'indie', 'catalog/category/view/id/12', 1, NULL, NULL, 12, NULL),
(4, 1, 'category/14', 'racing', 'catalog/category/view/id/14', 1, NULL, NULL, 14, NULL),
(5, 1, 'category/5', 'sandbox', 'catalog/category/view/id/5', 1, NULL, NULL, 5, NULL),
(6, 1, 'category/8', 'fps', 'catalog/category/view/id/8', 1, NULL, NULL, 8, NULL),
(7, 1, 'category/9', 'featured-game', 'catalog/category/view/id/9', 1, NULL, NULL, 9, NULL),
(8, 1, 'category/13', 'featured-game/sale', 'catalog/category/view/id/13', 1, NULL, NULL, 13, NULL),
(9, 1, 'product/7', 'days-gone', 'catalog/product/view/id/7', 1, NULL, NULL, NULL, 7),
(10, 1, 'product/7/9', 'featured-game/days-gone', 'catalog/product/view/id/7/category/9', 1, NULL, NULL, 9, 7),
(11, 1, 'product/7/10', 'jrpg/days-gone', 'catalog/product/view/id/7/category/10', 1, NULL, NULL, 10, 7),
(12, 1, 'product/8', 'minecraft-bedrock', 'catalog/product/view/id/8', 1, NULL, NULL, NULL, 8),
(13, 1, 'product/8/5', 'sandbox/minecraft-bedrock', 'catalog/product/view/id/8/category/5', 1, NULL, NULL, 5, 8),
(14, 1, 'product/8/9', 'featured-game/minecraft-bedrock', 'catalog/product/view/id/8/category/9', 1, NULL, NULL, 9, 8),
(15, 1, 'product/9', 'doom-eternal', 'catalog/product/view/id/9', 1, NULL, NULL, NULL, 9),
(16, 1, 'product/9/8', 'fps/doom-eternal', 'catalog/product/view/id/9/category/8', 1, NULL, NULL, 8, 9),
(17, 1, 'product/10', 'forza-horizon-4', 'catalog/product/view/id/10', 1, NULL, NULL, NULL, 10),
(18, 1, 'product/10/14', 'racing/forza-horizon-4', 'catalog/product/view/id/10/category/14', 1, NULL, NULL, 14, 10),
(19, 1, 'product/11', 'deus-ex-mankind-divided', 'catalog/product/view/id/11', 1, NULL, NULL, NULL, 11),
(20, 1, 'product/11/8', 'fps/deus-ex-mankind-divided', 'catalog/product/view/id/11/category/8', 1, NULL, NULL, 8, 11),
(21, 1, 'product/12', 'call-of-duty-world-war-ii', 'catalog/product/view/id/12', 1, NULL, NULL, NULL, 12),
(22, 1, 'product/12/8', 'fps/call-of-duty-world-war-ii', 'catalog/product/view/id/12/category/8', 1, NULL, NULL, 8, 12),
(23, 1, 'product/13', 'state-of-decay-2-juggernaut-edition', 'catalog/product/view/id/13', 1, NULL, NULL, NULL, 13),
(24, 1, 'product/13/5', 'sandbox/state-of-decay-2-juggernaut-edition', 'catalog/product/view/id/13/category/5', 1, NULL, NULL, 5, 13),
(25, 1, 'product/13/9', 'featured-game/state-of-decay-2-juggernaut-edition', 'catalog/product/view/id/13/category/9', 1, NULL, NULL, 9, 13),
(26, 1, 'product/13/13', 'featured-game/sale/state-of-decay-2-juggernaut-edition', 'catalog/product/view/id/13/category/13', 1, NULL, NULL, 13, 13),
(27, 1, 'product/14', 'tom-clancy-s-ghost-recon-wildlands', 'catalog/product/view/id/14', 1, NULL, NULL, NULL, 14),
(28, 1, 'product/14/10', 'jrpg/tom-clancy-s-ghost-recon-wildlands', 'catalog/product/view/id/14/category/10', 1, NULL, NULL, 10, 14),
(87, 1, 'product/15', 'little-nightmares-2', 'catalog/product/view/id/15', 1, NULL, NULL, NULL, 15),
(88, 1, 'product/15/12', 'indie/little-nightmares-2-15', 'catalog/product/view/id/15/category/12', 1, NULL, NULL, 12, 15);

-- --------------------------------------------------------

--
-- Table structure for table `core_variable`
--

CREATE TABLE `core_variable` (
  `variable_id` int(10) UNSIGNED NOT NULL COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';

-- --------------------------------------------------------

--
-- Table structure for table `core_variable_value`
--

CREATE TABLE `core_variable_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Variable Value Id',
  `variable_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Variable Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `plain_value` text DEFAULT NULL COMMENT 'Plain Text Value',
  `html_value` text DEFAULT NULL COMMENT 'Html Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';

-- --------------------------------------------------------

--
-- Table structure for table `core_website`
--

CREATE TABLE `core_website` (
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `default_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Default Group Id',
  `is_default` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Defines Is Website Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Websites';

--
-- Dumping data for table `core_website`
--

INSERT INTO `core_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated`
--

CREATE TABLE `coupon_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT 0 COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated_order`
--

CREATE TABLE `coupon_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT 0 COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated_updated`
--

CREATE TABLE `coupon_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT 0 COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) UNSIGNED NOT NULL COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text DEFAULT NULL COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity`
--

CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';

--
-- Dumping data for table `customer_address_entity`
--

INSERT INTO `customer_address_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `increment_id`, `parent_id`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 2, 0, NULL, 2, '2021-08-15 19:31:41', '2021-09-09 04:21:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_datetime`
--

CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_decimal`
--

CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_int`
--

CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';

--
-- Dumping data for table `customer_address_entity_int`
--

INSERT INTO `customer_address_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 2, 29, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_text`
--

CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';

--
-- Dumping data for table `customer_address_entity_text`
--

INSERT INTO `customer_address_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 2, 25, 1, 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_varchar`
--

CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';

--
-- Dumping data for table `customer_address_entity_varchar`
--

INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 2, 20, 1, 'admin'),
(2, 2, 22, 1, 'Magento'),
(3, 2, 26, 1, 'N/A'),
(4, 2, 30, 1, 'N/A'),
(5, 2, 27, 1, 'PH'),
(6, 2, 31, 1, 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute`
--

CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Multiline Count',
  `validate_rules` text DEFAULT NULL COMMENT 'Validate Rules',
  `is_system` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is System',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES
(1, 1, NULL, 0, NULL, 1, 10, NULL),
(2, 0, NULL, 0, NULL, 1, 0, NULL),
(3, 1, NULL, 0, NULL, 1, 20, NULL),
(4, 0, NULL, 0, NULL, 0, 30, NULL),
(5, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 40, NULL),
(6, 1, NULL, 0, NULL, 0, 50, NULL),
(7, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 60, NULL),
(8, 0, NULL, 0, NULL, 0, 70, NULL),
(9, 1, NULL, 0, 'a:1:{s:16:\"input_validation\";s:5:\"email\";}', 1, 80, NULL),
(10, 1, NULL, 0, NULL, 1, 25, NULL),
(11, 0, 'date', 0, 'a:1:{s:16:\"input_validation\";s:4:\"date\";}', 0, 90, NULL),
(12, 0, NULL, 0, NULL, 1, 0, NULL),
(13, 0, NULL, 0, NULL, 1, 0, NULL),
(14, 0, NULL, 0, NULL, 1, 0, NULL),
(15, 0, NULL, 0, 'a:1:{s:15:\"max_text_length\";i:255;}', 0, 100, NULL),
(16, 0, NULL, 0, NULL, 1, 0, NULL),
(17, 0, 'datetime', 0, NULL, 0, 0, NULL),
(18, 0, NULL, 0, 'a:0:{}', 0, 110, NULL),
(19, 0, NULL, 0, NULL, 0, 10, NULL),
(20, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 20, NULL),
(21, 1, NULL, 0, NULL, 0, 30, NULL),
(22, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 40, NULL),
(23, 0, NULL, 0, NULL, 0, 50, NULL),
(24, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 60, NULL),
(25, 1, NULL, 2, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 70, NULL),
(26, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 80, NULL),
(27, 1, NULL, 0, NULL, 1, 90, NULL),
(28, 1, NULL, 0, NULL, 1, 100, NULL),
(29, 1, NULL, 0, NULL, 1, 100, NULL),
(30, 1, NULL, 0, 'a:0:{}', 1, 110, 'customer/attribute_data_postcode'),
(31, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 120, NULL),
(32, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 130, NULL),
(33, 0, NULL, 0, NULL, 1, 0, NULL),
(34, 0, NULL, 0, 'a:1:{s:16:\"input_validation\";s:4:\"date\";}', 1, 0, NULL),
(35, 1, NULL, 0, NULL, 1, 28, NULL),
(36, 1, NULL, 0, NULL, 1, 140, NULL),
(37, 0, NULL, 0, NULL, 1, 0, NULL),
(38, 0, NULL, 0, NULL, 1, 0, NULL),
(39, 0, NULL, 0, NULL, 1, 0, NULL),
(40, 0, NULL, 0, NULL, 1, 0, NULL),
(41, 0, NULL, 0, NULL, 1, 0, NULL),
(42, 0, NULL, 0, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute_website`
--

CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Required',
  `default_value` text DEFAULT NULL COMMENT 'Default Value',
  `multiline_count` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Multiline Count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity`
--

CREATE TABLE `customer_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set Id',
  `website_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Disable automatic group change based on VAT ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';

--
-- Dumping data for table `customer_entity`
--

INSERT INTO `customer_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `website_id`, `email`, `group_id`, `increment_id`, `store_id`, `created_at`, `updated_at`, `is_active`, `disable_auto_group_change`) VALUES
(1, 1, 0, 1, 'test@gmail.com', 1, NULL, 1, '2021-07-29 07:03:52', '2021-07-29 07:03:52', 1, 0),
(2, 1, 0, 1, 'Ivrgs@gmail.com', 1, NULL, 1, '2021-07-29 22:34:49', '2021-09-09 04:21:15', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_datetime`
--

CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_decimal`
--

CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_int`
--

CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';

--
-- Dumping data for table `customer_entity_int`
--

INSERT INTO `customer_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 1, 41, 1, 1627571032),
(2, 1, 41, 2, 1627626889),
(3, 1, 13, 2, 1),
(4, 1, 14, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_text`
--

CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_varchar`
--

CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';

--
-- Dumping data for table `customer_entity_varchar`
--

INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 1, 5, 1, 'Test'),
(2, 1, 6, 1, 'test'),
(3, 1, 7, 1, 'test'),
(4, 1, 12, 1, 'e62064dde692f77a8fab114ffd6e2c3db0e246f2e093bfdef9b01f88b1f5f566:O57HMmaPHiPbtBthgEJqY2zCryxAhYIW'),
(5, 1, 3, 1, 'Default Store View'),
(6, 1, 5, 2, 'admin'),
(8, 1, 7, 2, 'Magento'),
(9, 1, 12, 2, '4069c7b2dfa692069d2e98d24c392b451c063d1b825539801abeb744378e9b9e:XDYk3e2wykk0APXDKSE5hDMgqYiDvQ2q'),
(10, 1, 3, 2, 'Default Store View');

-- --------------------------------------------------------

--
-- Table structure for table `customer_flowpassword`
--

CREATE TABLE `customer_flowpassword` (
  `flowpassword_id` int(10) UNSIGNED NOT NULL COMMENT 'Flow password Id',
  `ip` varchar(50) NOT NULL COMMENT 'User IP',
  `email` varchar(255) NOT NULL COMMENT 'Requested email for change',
  `requested_date` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Requested date for change'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer flow password';

-- --------------------------------------------------------

--
-- Table structure for table `customer_form_attribute`
--

CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `customer_form_attribute`
--

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_checkout', 9),
('adminhtml_checkout', 10),
('adminhtml_checkout', 11),
('adminhtml_checkout', 15),
('adminhtml_checkout', 18),
('adminhtml_customer', 1),
('adminhtml_customer', 3),
('adminhtml_customer', 4),
('adminhtml_customer', 5),
('adminhtml_customer', 6),
('adminhtml_customer', 7),
('adminhtml_customer', 8),
('adminhtml_customer', 9),
('adminhtml_customer', 10),
('adminhtml_customer', 11),
('adminhtml_customer', 15),
('adminhtml_customer', 17),
('adminhtml_customer', 18),
('adminhtml_customer', 35),
('adminhtml_customer_address', 19),
('adminhtml_customer_address', 20),
('adminhtml_customer_address', 21),
('adminhtml_customer_address', 22),
('adminhtml_customer_address', 23),
('adminhtml_customer_address', 24),
('adminhtml_customer_address', 25),
('adminhtml_customer_address', 26),
('adminhtml_customer_address', 27),
('adminhtml_customer_address', 28),
('adminhtml_customer_address', 29),
('adminhtml_customer_address', 30),
('adminhtml_customer_address', 31),
('adminhtml_customer_address', 32),
('adminhtml_customer_address', 36),
('checkout_register', 4),
('checkout_register', 5),
('checkout_register', 6),
('checkout_register', 7),
('checkout_register', 8),
('checkout_register', 9),
('checkout_register', 11),
('checkout_register', 15),
('checkout_register', 17),
('checkout_register', 18),
('customer_account_create', 4),
('customer_account_create', 5),
('customer_account_create', 6),
('customer_account_create', 7),
('customer_account_create', 8),
('customer_account_create', 9),
('customer_account_create', 11),
('customer_account_create', 15),
('customer_account_create', 17),
('customer_account_create', 18),
('customer_account_edit', 4),
('customer_account_edit', 5),
('customer_account_edit', 6),
('customer_account_edit', 7),
('customer_account_edit', 8),
('customer_account_edit', 9),
('customer_account_edit', 11),
('customer_account_edit', 15),
('customer_account_edit', 17),
('customer_account_edit', 18),
('customer_address_edit', 19),
('customer_address_edit', 20),
('customer_address_edit', 21),
('customer_address_edit', 22),
('customer_address_edit', 23),
('customer_address_edit', 24),
('customer_address_edit', 25),
('customer_address_edit', 26),
('customer_address_edit', 27),
('customer_address_edit', 28),
('customer_address_edit', 29),
('customer_address_edit', 30),
('customer_address_edit', 31),
('customer_address_edit', 32),
('customer_address_edit', 36),
('customer_register_address', 19),
('customer_register_address', 20),
('customer_register_address', 21),
('customer_register_address', 22),
('customer_register_address', 23),
('customer_register_address', 24),
('customer_register_address', 25),
('customer_register_address', 26),
('customer_register_address', 27),
('customer_register_address', 28),
('customer_register_address', 29),
('customer_register_address', 30),
('customer_register_address', 31),
('customer_register_address', 32),
('customer_register_address', 36);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tax Class Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Group';

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch`
--

CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) UNSIGNED NOT NULL COMMENT 'Batch Id',
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `adapter` varchar(128) DEFAULT NULL COMMENT 'Adapter',
  `params` text DEFAULT NULL COMMENT 'Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch';

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch_export`
--

CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Batch Export Id',
  `batch_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Batch Id',
  `batch_data` longtext DEFAULT NULL COMMENT 'Batch Data',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Export';

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch_import`
--

CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Batch Import Id',
  `batch_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Batch Id',
  `batch_data` longtext DEFAULT NULL COMMENT 'Batch Data',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Import';

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_import_data`
--

CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL COMMENT 'Import Id',
  `session_id` int(11) DEFAULT NULL COMMENT 'Session Id',
  `serial_number` int(11) NOT NULL DEFAULT 0 COMMENT 'Serial Number',
  `value` text DEFAULT NULL COMMENT 'Value',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Import Data';

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_profile`
--

CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) UNSIGNED NOT NULL COMMENT 'Profile Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `actions_xml` text DEFAULT NULL COMMENT 'Actions Xml',
  `gui_data` text DEFAULT NULL COMMENT 'Gui Data',
  `direction` varchar(6) DEFAULT NULL COMMENT 'Direction',
  `entity_type` varchar(64) DEFAULT NULL COMMENT 'Entity Type',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `data_transfer` varchar(11) DEFAULT NULL COMMENT 'Data Transfer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile';

--
-- Dumping data for table `dataflow_profile`
--

INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES
(1, 'Export All Products', '2021-07-26 01:29:57', '2021-07-26 01:29:57', '<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'export', 'product', 0, 'file'),
(2, 'Export Product Stocks', '2021-07-26 01:29:57', '2021-07-26 01:29:57', '<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'export', 'product', 0, 'file'),
(3, 'Import All Products', '2021-07-26 01:29:57', '2021-07-26 01:29:57', '<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'import', 'product', 0, 'interactive'),
(4, 'Import Product Stocks', '2021-07-26 01:29:57', '2021-07-26 01:29:57', '<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'import', 'product', 0, 'interactive'),
(5, 'Export Customers', '2021-07-26 01:29:57', '2021-07-26 01:29:57', '<action type=\"customer/convert_adapter_customer\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'export', 'customer', 0, 'file'),
(6, 'Import Customers', '2021-07-26 01:29:57', '2021-07-26 01:29:57', '<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'import', 'customer', 0, 'interactive');

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_profile_history`
--

CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) UNSIGNED NOT NULL COMMENT 'History Id',
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Id',
  `action_code` varchar(64) DEFAULT NULL COMMENT 'Action Code',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User Id',
  `performed_at` timestamp NULL DEFAULT NULL COMMENT 'Performed At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile History';

--
-- Dumping data for table `dataflow_profile_history`
--

INSERT INTO `dataflow_profile_history` (`history_id`, `profile_id`, `action_code`, `user_id`, `performed_at`) VALUES
(1, 1, 'create', 0, '2021-07-26 01:29:57'),
(2, 2, 'create', 0, '2021-07-26 01:29:57'),
(3, 3, 'create', 0, '2021-07-26 01:29:57'),
(4, 4, 'create', 0, '2021-07-26 01:29:57'),
(5, 5, 'create', 0, '2021-07-26 01:29:57'),
(6, 6, 'create', 0, '2021-07-26 01:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_session`
--

CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL COMMENT 'Session Id',
  `user_id` int(11) NOT NULL COMMENT 'User Id',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Created Date',
  `file` varchar(255) DEFAULT NULL COMMENT 'File',
  `type` varchar(32) DEFAULT NULL COMMENT 'Type',
  `direction` varchar(32) DEFAULT NULL COMMENT 'Direction',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Comment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Session';

-- --------------------------------------------------------

--
-- Table structure for table `design_change`
--

CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL COMMENT 'Design Change Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';

-- --------------------------------------------------------

--
-- Table structure for table `directory_country`
--

CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Dumping data for table `directory_country`
--

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PR', 'PR', 'PRI'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_format`
--

CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) UNSIGNED NOT NULL COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region`
--

CREATE TABLE `directory_country_region` (
  `region_id` int(10) UNSIGNED NOT NULL COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';

--
-- Dumping data for table `directory_country_region`
--

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AF', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AC', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AM', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-W??rttemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Th??ringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Nieder??sterreich'),
(97, 'AT', 'OO', 'Ober??sterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'K??rnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Vorarlberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graub??nden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Z??rich'),
(130, 'ES', 'A Coru??a', 'A Coru??a'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '1', 'Ain'),
(183, 'FR', '2', 'Aisne'),
(184, 'FR', '3', 'Allier'),
(185, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 'FR', '5', 'Hautes-Alpes'),
(187, 'FR', '6', 'Alpes-Maritimes'),
(188, 'FR', '7', 'Ard??che'),
(189, 'FR', '8', 'Ardennes'),
(190, 'FR', '9', 'Ari??ge'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rh??ne'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corr??ze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'C??te-d\'Or'),
(204, 'FR', '22', 'C??tes-d\'Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Dr??me'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finist??re'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'H??rault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Is??re'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Loz??re'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Ni??vre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-D??me'),
(246, 'FR', '64', 'Pyr??n??es-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyr??n??es'),
(248, 'FR', '66', 'Pyr??n??es-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rh??ne'),
(252, 'FR', '70', 'Haute-Sa??ne'),
(253, 'FR', '71', 'Sa??ne-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-S??vres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vend??e'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d\'Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Arge??'),
(281, 'RO', 'BC', 'Bac??u'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistri??a-N??s??ud'),
(284, 'RO', 'BT', 'Boto??ani'),
(285, 'RO', 'BV', 'Bra??ov'),
(286, 'RO', 'BR', 'Br??ila'),
(287, 'RO', 'B', 'Bucure??ti'),
(288, 'RO', 'BZ', 'Buz??u'),
(289, 'RO', 'CS', 'Cara??-Severin'),
(290, 'RO', 'CL', 'C??l??ra??i'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constan??a'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'D??mbovi??a'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Gala??i'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomi??a'),
(302, 'RO', 'IS', 'Ia??i'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramure??'),
(305, 'RO', 'MH', 'Mehedin??i'),
(306, 'RO', 'MS', 'Mure??'),
(307, 'RO', 'NT', 'Neam??'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'S??laj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timi??'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'V??lcea'),
(319, 'RO', 'VN', 'Vrancea'),
(320, 'FI', 'Lappi', 'Lappi'),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 'FI', 'Kainuu', 'Kainuu'),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 'FI', 'Etel??-Savo', 'Etel??-Savo'),
(326, 'FI', 'Etel??-Pohjanmaa', 'Etel??-Pohjanmaa'),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 'FI', 'Satakunta', 'Satakunta'),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 'FI', 'Etel??-Karjala', 'Etel??-Karjala'),
(334, 'FI', 'P??ij??t-H??me', 'P??ij??t-H??me'),
(335, 'FI', 'Kanta-H??me', 'Kanta-H??me'),
(336, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 'FI', 'It??-Uusimaa', 'It??-Uusimaa'),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 'EE', 'EE-37', 'Harjumaa'),
(341, 'EE', 'EE-39', 'Hiiumaa'),
(342, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 'EE', 'EE-49', 'J??gevamaa'),
(344, 'EE', 'EE-51', 'J??rvamaa'),
(345, 'EE', 'EE-57', 'L????nemaa'),
(346, 'EE', 'EE-59', 'L????ne-Virumaa'),
(347, 'EE', 'EE-65', 'P??lvamaa'),
(348, 'EE', 'EE-67', 'P??rnumaa'),
(349, 'EE', 'EE-70', 'Raplamaa'),
(350, 'EE', 'EE-74', 'Saaremaa'),
(351, 'EE', 'EE-78', 'Tartumaa'),
(352, 'EE', 'EE-82', 'Valgamaa'),
(353, 'EE', 'EE-84', 'Viljandimaa'),
(354, 'EE', 'EE-86', 'V??rumaa'),
(355, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 'LV', 'LV-JEL', 'Jelgava'),
(357, 'LV', 'J??kabpils', 'J??kabpils'),
(358, 'LV', 'LV-JUR', 'J??rmala'),
(359, 'LV', 'LV-LPX', 'Liep??ja'),
(360, 'LV', 'LV-LE', 'Liep??jas novads'),
(361, 'LV', 'LV-REZ', 'R??zekne'),
(362, 'LV', 'LV-RIX', 'R??ga'),
(363, 'LV', 'LV-RI', 'R??gas novads'),
(364, 'LV', 'Valmiera', 'Valmiera'),
(365, 'LV', 'LV-VEN', 'Ventspils'),
(366, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 'LV', 'Akn??stes novads', 'Akn??stes novads'),
(370, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 'LV', 'LV-AL', 'Al??ksnes novads'),
(373, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 'LV', 'Apes novads', 'Apes novads'),
(375, 'LV', 'Auces novads', 'Auces novads'),
(376, 'LV', 'Bab??tes novads', 'Bab??tes novads'),
(377, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 'LV', 'LV-BL', 'Balvu novads'),
(380, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 'LV', 'Bever??nas novads', 'Bever??nas novads'),
(382, 'LV', 'Broc??nu novads', 'Broc??nu novads'),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 'LV', 'LV-CE', 'C??su novads'),
(388, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 'LV', 'Engures novads', 'Engures novads'),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 'LV', 'Grobi??as novads', 'Grobi??as novads'),
(396, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 'LV', 'Ik????iles novads', 'Ik????iles novads'),
(399, 'LV', 'Il??kstes novads', 'Il??kstes novads'),
(400, 'LV', 'In??ukalna novads', 'In??ukalna novads'),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 'LV', 'LV-JK', 'J??kabpils novads'),
(406, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 'LV', 'LV-KR', 'Kr??slavas novads'),
(411, 'LV', 'LV-KU', 'Kuld??gas novads'),
(412, 'LV', 'K??rsavas novads', 'K??rsavas novads'),
(413, 'LV', 'Lielv??rdes novads', 'Lielv??rdes novads'),
(414, 'LV', 'LV-LM', 'Limba??u novads'),
(415, 'LV', 'Lub??nas novads', 'Lub??nas novads'),
(416, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 'LV', 'L??gatnes novads', 'L??gatnes novads'),
(418, 'LV', 'L??v??nu novads', 'L??v??nu novads'),
(419, 'LV', 'LV-MA', 'Madonas novads'),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 'LV', 'M??lpils novads', 'M??lpils novads'),
(422, 'LV', 'M??rupes novads', 'M??rupes novads'),
(423, 'LV', 'Nauk????nu novads', 'Nauk????nu novads'),
(424, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 'LV', 'N??cas novads', 'N??cas novads'),
(426, 'LV', 'LV-OG', 'Ogres novads'),
(427, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 'LV', 'LV-PR', 'Prei??u novads'),
(430, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 'LV', 'Prieku??u novads', 'Prieku??u novads'),
(432, 'LV', 'P??rgaujas novads', 'P??rgaujas novads'),
(433, 'LV', 'P??vilostas novads', 'P??vilostas novads'),
(434, 'LV', 'P??avi??u novads', 'P??avi??u novads'),
(435, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 'LV', 'Riebi??u novads', 'Riebi??u novads'),
(437, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 'LV', 'Ropa??u novads', 'Ropa??u novads'),
(439, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 'LV', 'Rug??ju novads', 'Rug??ju novads'),
(441, 'LV', 'Rund??les novads', 'Rund??les novads'),
(442, 'LV', 'LV-RE', 'R??zeknes novads'),
(443, 'LV', 'R??jienas novads', 'R??jienas novads'),
(444, 'LV', 'Salacgr??vas novads', 'Salacgr??vas novads'),
(445, 'LV', 'Salas novads', 'Salas novads'),
(446, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 'LV', 'LV-SA', 'Saldus novads'),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 'LV', 'Skr??veru novads', 'Skr??veru novads'),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 'LV', 'Stopi??u novads', 'Stopi??u novads'),
(454, 'LV', 'Stren??u novads', 'Stren??u novads'),
(455, 'LV', 'S??jas novads', 'S??jas novads'),
(456, 'LV', 'LV-TA', 'Talsu novads'),
(457, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 'LV', 'T??rvetes novads', 'T??rvetes novads'),
(459, 'LV', 'Vai??odes novads', 'Vai??odes novads'),
(460, 'LV', 'LV-VK', 'Valkas novads'),
(461, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 'LV', 'Varak????nu novads', 'Varak????nu novads'),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 'LV', 'Vies??tes novads', 'Vies??tes novads'),
(467, 'LV', 'Vi??akas novads', 'Vi??akas novads'),
(468, 'LV', 'Vi????nu novads', 'Vi????nu novads'),
(469, 'LV', 'V??rkavas novads', 'V??rkavas novads'),
(470, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 'LV', '??da??u novads', '??da??u novads'),
(472, 'LV', '??rg??u novads', '??rg??u novads'),
(473, 'LV', '??eguma novads', '??eguma novads'),
(474, 'LV', '??ekavas novads', '??ekavas novads'),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 'LT', 'LT-KL', 'Klaip??dos Apskritis'),
(478, 'LT', 'LT-MR', 'Marijampol??s Apskritis'),
(479, 'LT', 'LT-PN', 'Panev????io Apskritis'),
(480, 'LT', 'LT-SA', '??iauli?? Apskritis'),
(481, 'LT', 'LT-TA', 'Taurag??s Apskritis'),
(482, 'LT', 'LT-TE', 'Tel??i?? Apskritis'),
(483, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region_name`
--

CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-W??rttemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Th??ringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Nieder??sterreich'),
('en_US', 97, 'Ober??sterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'K??rnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Vorarlberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graub??nden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Z??rich'),
('en_US', 130, 'A Coru??a'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ard??che'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ari??ge'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rh??ne'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corr??ze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'C??te-d\'Or'),
('en_US', 204, 'C??tes-d\'Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Dr??me'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finist??re'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'H??rault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Is??re'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Loz??re'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Ni??vre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-D??me'),
('en_US', 246, 'Pyr??n??es-Atlantiques'),
('en_US', 247, 'Hautes-Pyr??n??es'),
('en_US', 248, 'Pyr??n??es-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rh??ne'),
('en_US', 252, 'Haute-Sa??ne'),
('en_US', 253, 'Sa??ne-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-S??vres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vend??e'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d\'Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Arge??'),
('en_US', 281, 'Bac??u'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistri??a-N??s??ud'),
('en_US', 284, 'Boto??ani'),
('en_US', 285, 'Bra??ov'),
('en_US', 286, 'Br??ila'),
('en_US', 287, 'Bucure??ti'),
('en_US', 288, 'Buz??u'),
('en_US', 289, 'Cara??-Severin'),
('en_US', 290, 'C??l??ra??i'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constan??a'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'D??mbovi??a'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Gala??i'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomi??a'),
('en_US', 302, 'Ia??i'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramure??'),
('en_US', 305, 'Mehedin??i'),
('en_US', 306, 'Mure??'),
('en_US', 307, 'Neam??'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'S??laj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timi??'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'V??lcea'),
('en_US', 319, 'Vrancea'),
('en_US', 320, 'Lappi'),
('en_US', 321, 'Pohjois-Pohjanmaa'),
('en_US', 322, 'Kainuu'),
('en_US', 323, 'Pohjois-Karjala'),
('en_US', 324, 'Pohjois-Savo'),
('en_US', 325, 'Etel??-Savo'),
('en_US', 326, 'Etel??-Pohjanmaa'),
('en_US', 327, 'Pohjanmaa'),
('en_US', 328, 'Pirkanmaa'),
('en_US', 329, 'Satakunta'),
('en_US', 330, 'Keski-Pohjanmaa'),
('en_US', 331, 'Keski-Suomi'),
('en_US', 332, 'Varsinais-Suomi'),
('en_US', 333, 'Etel??-Karjala'),
('en_US', 334, 'P??ij??t-H??me'),
('en_US', 335, 'Kanta-H??me'),
('en_US', 336, 'Uusimaa'),
('en_US', 337, 'It??-Uusimaa'),
('en_US', 338, 'Kymenlaakso'),
('en_US', 339, 'Ahvenanmaa'),
('en_US', 340, 'Harjumaa'),
('en_US', 341, 'Hiiumaa'),
('en_US', 342, 'Ida-Virumaa'),
('en_US', 343, 'J??gevamaa'),
('en_US', 344, 'J??rvamaa'),
('en_US', 345, 'L????nemaa'),
('en_US', 346, 'L????ne-Virumaa'),
('en_US', 347, 'P??lvamaa'),
('en_US', 348, 'P??rnumaa'),
('en_US', 349, 'Raplamaa'),
('en_US', 350, 'Saaremaa'),
('en_US', 351, 'Tartumaa'),
('en_US', 352, 'Valgamaa'),
('en_US', 353, 'Viljandimaa'),
('en_US', 354, 'V??rumaa'),
('en_US', 355, 'Daugavpils'),
('en_US', 356, 'Jelgava'),
('en_US', 357, 'J??kabpils'),
('en_US', 358, 'J??rmala'),
('en_US', 359, 'Liep??ja'),
('en_US', 360, 'Liep??jas novads'),
('en_US', 361, 'R??zekne'),
('en_US', 362, 'R??ga'),
('en_US', 363, 'R??gas novads'),
('en_US', 364, 'Valmiera'),
('en_US', 365, 'Ventspils'),
('en_US', 366, 'Aglonas novads'),
('en_US', 367, 'Aizkraukles novads'),
('en_US', 368, 'Aizputes novads'),
('en_US', 369, 'Akn??stes novads'),
('en_US', 370, 'Alojas novads'),
('en_US', 371, 'Alsungas novads'),
('en_US', 372, 'Al??ksnes novads'),
('en_US', 373, 'Amatas novads'),
('en_US', 374, 'Apes novads'),
('en_US', 375, 'Auces novads'),
('en_US', 376, 'Bab??tes novads'),
('en_US', 377, 'Baldones novads'),
('en_US', 378, 'Baltinavas novads'),
('en_US', 379, 'Balvu novads'),
('en_US', 380, 'Bauskas novads'),
('en_US', 381, 'Bever??nas novads'),
('en_US', 382, 'Broc??nu novads'),
('en_US', 383, 'Burtnieku novads'),
('en_US', 384, 'Carnikavas novads'),
('en_US', 385, 'Cesvaines novads'),
('en_US', 386, 'Ciblas novads'),
('en_US', 387, 'C??su novads'),
('en_US', 388, 'Dagdas novads'),
('en_US', 389, 'Daugavpils novads'),
('en_US', 390, 'Dobeles novads'),
('en_US', 391, 'Dundagas novads'),
('en_US', 392, 'Durbes novads'),
('en_US', 393, 'Engures novads'),
('en_US', 394, 'Garkalnes novads'),
('en_US', 395, 'Grobi??as novads'),
('en_US', 396, 'Gulbenes novads'),
('en_US', 397, 'Iecavas novads'),
('en_US', 398, 'Ik????iles novads'),
('en_US', 399, 'Il??kstes novads'),
('en_US', 400, 'In??ukalna novads'),
('en_US', 401, 'Jaunjelgavas novads'),
('en_US', 402, 'Jaunpiebalgas novads'),
('en_US', 403, 'Jaunpils novads'),
('en_US', 404, 'Jelgavas novads'),
('en_US', 405, 'J??kabpils novads'),
('en_US', 406, 'Kandavas novads'),
('en_US', 407, 'Kokneses novads'),
('en_US', 408, 'Krimuldas novads'),
('en_US', 409, 'Krustpils novads'),
('en_US', 410, 'Kr??slavas novads'),
('en_US', 411, 'Kuld??gas novads'),
('en_US', 412, 'K??rsavas novads'),
('en_US', 413, 'Lielv??rdes novads'),
('en_US', 414, 'Limba??u novads'),
('en_US', 415, 'Lub??nas novads'),
('en_US', 416, 'Ludzas novads'),
('en_US', 417, 'L??gatnes novads'),
('en_US', 418, 'L??v??nu novads'),
('en_US', 419, 'Madonas novads'),
('en_US', 420, 'Mazsalacas novads'),
('en_US', 421, 'M??lpils novads'),
('en_US', 422, 'M??rupes novads'),
('en_US', 423, 'Nauk????nu novads'),
('en_US', 424, 'Neretas novads'),
('en_US', 425, 'N??cas novads'),
('en_US', 426, 'Ogres novads'),
('en_US', 427, 'Olaines novads'),
('en_US', 428, 'Ozolnieku novads'),
('en_US', 429, 'Prei??u novads'),
('en_US', 430, 'Priekules novads'),
('en_US', 431, 'Prieku??u novads'),
('en_US', 432, 'P??rgaujas novads'),
('en_US', 433, 'P??vilostas novads'),
('en_US', 434, 'P??avi??u novads'),
('en_US', 435, 'Raunas novads'),
('en_US', 436, 'Riebi??u novads'),
('en_US', 437, 'Rojas novads'),
('en_US', 438, 'Ropa??u novads'),
('en_US', 439, 'Rucavas novads'),
('en_US', 440, 'Rug??ju novads'),
('en_US', 441, 'Rund??les novads'),
('en_US', 442, 'R??zeknes novads'),
('en_US', 443, 'R??jienas novads'),
('en_US', 444, 'Salacgr??vas novads'),
('en_US', 445, 'Salas novads'),
('en_US', 446, 'Salaspils novads'),
('en_US', 447, 'Saldus novads'),
('en_US', 448, 'Saulkrastu novads'),
('en_US', 449, 'Siguldas novads'),
('en_US', 450, 'Skrundas novads'),
('en_US', 451, 'Skr??veru novads'),
('en_US', 452, 'Smiltenes novads'),
('en_US', 453, 'Stopi??u novads'),
('en_US', 454, 'Stren??u novads'),
('en_US', 455, 'S??jas novads'),
('en_US', 456, 'Talsu novads'),
('en_US', 457, 'Tukuma novads'),
('en_US', 458, 'T??rvetes novads'),
('en_US', 459, 'Vai??odes novads'),
('en_US', 460, 'Valkas novads'),
('en_US', 461, 'Valmieras novads'),
('en_US', 462, 'Varak????nu novads'),
('en_US', 463, 'Vecpiebalgas novads'),
('en_US', 464, 'Vecumnieku novads'),
('en_US', 465, 'Ventspils novads'),
('en_US', 466, 'Vies??tes novads'),
('en_US', 467, 'Vi??akas novads'),
('en_US', 468, 'Vi????nu novads'),
('en_US', 469, 'V??rkavas novads'),
('en_US', 470, 'Zilupes novads'),
('en_US', 471, '??da??u novads'),
('en_US', 472, '??rg??u novads'),
('en_US', 473, '??eguma novads'),
('en_US', 474, '??ekavas novads'),
('en_US', 475, 'Alytaus Apskritis'),
('en_US', 476, 'Kauno Apskritis'),
('en_US', 477, 'Klaip??dos Apskritis'),
('en_US', 478, 'Marijampol??s Apskritis'),
('en_US', 479, 'Panev????io Apskritis'),
('en_US', 480, '??iauli?? Apskritis'),
('en_US', 481, 'Taurag??s Apskritis'),
('en_US', 482, 'Tel??i?? Apskritis'),
('en_US', 483, 'Utenos Apskritis'),
('en_US', 484, 'Vilniaus Apskritis');

-- --------------------------------------------------------

--
-- Table structure for table `directory_currency_rate`
--

CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT 0.000000000000 COMMENT 'Currency Conversion Rate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', '1.000000000000'),
('EUR', 'USD', '1.415000000000'),
('USD', 'EUR', '0.706700000000'),
('USD', 'USD', '1.000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link`
--

CREATE TABLE `downloadable_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';

--
-- Dumping data for table `downloadable_link`
--

INSERT INTO `downloadable_link` (`link_id`, `product_id`, `sort_order`, `number_of_downloads`, `is_shareable`, `link_url`, `link_file`, `link_type`, `sample_url`, `sample_file`, `sample_type`) VALUES
(1, 7, 0, 0, 0, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL),
(2, 8, 0, 0, 0, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL),
(3, 9, 0, 0, 2, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL),
(4, 11, 0, 0, 2, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL),
(5, 12, 0, 0, 2, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL),
(6, 13, 0, 0, 2, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL),
(7, 14, 0, 0, 0, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_price`
--

CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) UNSIGNED NOT NULL COMMENT 'Price ID',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Link ID',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';

--
-- Dumping data for table `downloadable_link_price`
--

INSERT INTO `downloadable_link_price` (`price_id`, `link_id`, `website_id`, `price`) VALUES
(1, 1, 0, '0.0000'),
(2, 2, 0, '0.0000'),
(3, 3, 0, '0.0000'),
(4, 4, 0, '0.0000'),
(5, 5, 0, '0.0000'),
(6, 6, 0, '0.0000'),
(7, 7, 0, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) UNSIGNED NOT NULL COMMENT 'Purchased ID',
  `order_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of modification',
  `customer_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';

--
-- Dumping data for table `downloadable_link_purchased`
--

INSERT INTO `downloadable_link_purchased` (`purchased_id`, `order_id`, `order_increment_id`, `order_item_id`, `created_at`, `updated_at`, `customer_id`, `product_name`, `product_sku`, `link_section_title`) VALUES
(1, 3, '100000003', 4, '2021-09-09 04:21:16', '2021-09-09 04:21:16', 2, 'Days Gone', '12345', 'Links');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased_item`
--

CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item ID',
  `purchased_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Purchased ID',
  `order_item_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Order Item ID',
  `product_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of downloads used',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';

--
-- Dumping data for table `downloadable_link_purchased_item`
--

INSERT INTO `downloadable_link_purchased_item` (`item_id`, `purchased_id`, `order_item_id`, `product_id`, `link_hash`, `number_of_downloads_bought`, `number_of_downloads_used`, `link_id`, `link_title`, `is_shareable`, `link_url`, `link_file`, `link_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 7, 'MC43NzE2NTEwMCAxNjMxMTkwMDc2MTQ3', 0, 0, 1, 'GDrive', 2, 'https://drive.google.com/file/d/1Bj4Ex4B1RgP3BW7e-s56s-fsI4qti-e9/view?usp=sharing', NULL, 'url', 'available', '2021-09-09 04:21:16', '2021-09-09 04:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_title`
--

CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) UNSIGNED NOT NULL COMMENT 'Title ID',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Link ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';

--
-- Dumping data for table `downloadable_link_title`
--

INSERT INTO `downloadable_link_title` (`title_id`, `link_id`, `store_id`, `title`) VALUES
(1, 1, 0, 'GDrive'),
(2, 2, 0, 'GDrive'),
(3, 3, 0, 'GDrive'),
(4, 4, 0, 'GDrive'),
(5, 5, 0, 'GDrive'),
(6, 6, 0, 'GDrive'),
(7, 7, 0, 'GDrive');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample`
--

CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) UNSIGNED NOT NULL COMMENT 'Sample ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample_title`
--

CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) UNSIGNED NOT NULL COMMENT 'Title ID',
  `sample_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sample ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Defines Is User Defined',
  `default_value` text DEFAULT NULL COMMENT 'Default Value',
  `is_unique` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'customer/customer_attribute_backend_website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'customer/customer_attribute_source_website', 1, 0, NULL, 0, NULL),
(2, 1, 'store_id', NULL, 'customer/customer_attribute_backend_store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'customer/customer_attribute_source_store', 1, 0, NULL, 0, NULL),
(3, 1, 'created_in', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL),
(4, 1, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(5, 1, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(6, 1, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(7, 1, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(8, 1, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL),
(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'customer/customer_attribute_source_group', 1, 0, NULL, 0, NULL),
(11, 1, 'dob', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, 'eav/entity_attribute_frontend_datetime', 'date', 'Date Of Birth', NULL, NULL, 0, 0, NULL, 0, NULL),
(12, 1, 'password_hash', NULL, 'customer/customer_attribute_backend_password', 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(13, 1, 'default_billing', NULL, 'customer/customer_attribute_backend_billing', 'int', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(14, 1, 'default_shipping', NULL, 'customer/customer_attribute_backend_shipping', 'int', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(15, 1, 'taxvat', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(16, 1, 'confirmation', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL),
(17, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'datetime', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL),
(18, 1, 'gender', NULL, NULL, 'int', NULL, NULL, 'select', 'Gender', NULL, 'eav/entity_attribute_source_table', 0, 0, NULL, 0, NULL),
(19, 2, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(20, 2, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(21, 2, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(22, 2, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(23, 2, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(24, 2, 'company', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL),
(25, 2, 'street', NULL, 'customer/entity_address_attribute_backend_street', 'text', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL),
(26, 2, 'city', NULL, NULL, 'varchar', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL),
(27, 2, 'country_id', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country', NULL, 'customer/entity_address_attribute_source_country', 1, 0, NULL, 0, NULL),
(28, 2, 'region', NULL, 'customer/entity_address_attribute_backend_region', 'varchar', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL),
(29, 2, 'region_id', NULL, NULL, 'int', NULL, NULL, 'hidden', 'State/Province', NULL, 'customer/entity_address_attribute_source_region', 0, 0, NULL, 0, NULL),
(30, 2, 'postcode', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 1, 0, NULL, 0, NULL),
(31, 2, 'telephone', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Telephone', NULL, NULL, 1, 0, NULL, 0, NULL),
(32, 2, 'fax', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL),
(33, 1, 'rp_token', NULL, NULL, 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(34, 1, 'rp_token_created_at', NULL, NULL, 'datetime', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(35, 1, 'disable_auto_group_change', NULL, 'customer/attribute_backend_data_boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(36, 2, 'vat_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number', NULL, NULL, 0, 0, NULL, 0, NULL),
(37, 2, 'vat_is_valid', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL),
(38, 2, 'vat_request_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(39, 2, 'vat_request_date', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL),
(40, 2, 'vat_request_success', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL),
(41, 1, 'password_created_at', NULL, NULL, 'int', NULL, NULL, 'text', 'Password created at', NULL, NULL, 0, 0, NULL, 0, NULL),
(42, 1, 'rp_customer_id', NULL, NULL, 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(43, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(44, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'eav/entity_attribute_source_boolean', 1, 0, NULL, 0, NULL),
(45, 3, 'url_key', NULL, 'catalog/category_attribute_backend_urlkey', 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(46, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(47, 3, 'image', NULL, 'catalog/category_attribute_backend_image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(48, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(49, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(50, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(51, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'catalog/category_attribute_source_mode', 0, 0, NULL, 0, NULL),
(52, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'catalog/category_attribute_source_page', 0, 0, NULL, 0, NULL),
(53, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(54, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL),
(55, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL),
(56, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(57, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(58, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(59, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(60, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'core/design_source_design', 0, 0, NULL, 0, NULL),
(61, 3, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(62, 3, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(63, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'catalog/category_attribute_source_layout', 0, 0, NULL, 0, NULL),
(64, 3, 'custom_layout_update', NULL, 'catalog/attribute_backend_customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(65, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL),
(66, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL),
(67, 3, 'available_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'catalog/category_attribute_source_sortby', 1, 0, NULL, 0, NULL),
(68, 3, 'default_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'catalog/category_attribute_source_sortby', 1, 0, NULL, 0, NULL),
(69, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'eav/entity_attribute_source_boolean', 1, 0, '1', 0, NULL),
(70, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(71, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(72, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL),
(73, 4, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(74, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 1, 0, NULL, 0, NULL),
(75, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(76, 4, 'sku', NULL, 'catalog/product_attribute_backend_sku', 'static', NULL, NULL, 'text', 'SKU', NULL, NULL, 0, 0, NULL, 1, NULL),
(77, 4, 'price', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL),
(78, 4, 'special_price', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Special Price', 'validate-special-price', NULL, 0, 0, NULL, 0, NULL),
(79, 4, 'special_from_date', NULL, 'catalog/product_attribute_backend_startdate_specialprice', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(80, 4, 'special_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(81, 4, 'cost', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL),
(82, 4, 'weight', NULL, NULL, 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 0, 0, NULL, 0, NULL),
(83, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL),
(84, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(85, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(86, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars'),
(87, 4, 'image', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Base Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(88, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Small Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(89, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL),
(90, 4, 'media_gallery', NULL, 'catalog/product_attribute_backend_media', 'varchar', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(91, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(92, 4, 'group_price', NULL, 'catalog/product_attribute_backend_groupprice', 'decimal', NULL, NULL, 'text', 'Group Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(93, 4, 'tier_price', NULL, 'catalog/product_attribute_backend_tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(94, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, NULL, 0, NULL),
(95, 4, 'news_from_date', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(96, 4, 'news_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(97, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(98, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Status', NULL, 'catalog/product_status', 1, 0, NULL, 0, NULL),
(99, 4, 'url_key', NULL, 'catalog/product_attribute_backend_urlkey', 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(100, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(101, 4, 'minimal_price', NULL, NULL, 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(102, 4, 'is_recurring', NULL, NULL, 'int', NULL, NULL, 'select', 'Enable Recurring Profile', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, 'Products with recurring profile participate in catalog as nominal items.'),
(103, 4, 'recurring_profile', NULL, 'catalog/product_attribute_backend_recurring', 'text', NULL, NULL, 'text', 'Recurring Payment Profile', NULL, NULL, 0, 0, NULL, 0, NULL),
(104, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'catalog/product_visibility', 1, 0, '4', 0, NULL),
(105, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'core/design_source_design', 0, 0, NULL, 0, NULL),
(106, 4, 'custom_design_from', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(107, 4, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(108, 4, 'custom_layout_update', NULL, 'catalog/attribute_backend_customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(109, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'catalog/product_attribute_source_layout', 0, 0, NULL, 0, NULL),
(110, 4, 'category_ids', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(111, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'catalog/entity_product_attribute_design_options_container', 0, 0, 'container1', 0, NULL),
(112, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(113, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(114, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(115, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(116, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(117, 4, 'created_at', NULL, 'eav/entity_attribute_backend_time_created', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(118, 4, 'updated_at', NULL, 'eav/entity_attribute_backend_time_updated', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(119, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'catalog/product_attribute_source_countryofmanufacture', 0, 0, NULL, 0, NULL),
(120, 4, 'msrp_enabled', NULL, 'catalog/product_attribute_backend_msrp', 'varchar', NULL, NULL, 'select', 'Apply MAP', NULL, 'catalog/product_attribute_source_msrp_type_enabled', 0, 0, '2', 0, NULL),
(121, 4, 'msrp_display_actual_price_type', NULL, 'catalog/product_attribute_backend_boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'catalog/product_attribute_source_msrp_type_price', 0, 0, '4', 0, NULL),
(122, 4, 'msrp', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Manufacturer\'s Suggested Retail Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(123, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'tax/class_source_product', 1, 0, NULL, 0, NULL),
(124, 4, 'gift_message_available', NULL, 'catalog/product_attribute_backend_boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(125, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(126, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(127, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(128, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'bundle/product_attribute_source_price_view', 1, 0, NULL, 0, NULL),
(129, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, NULL, 'Shipment', NULL, NULL, 1, 0, NULL, 0, NULL),
(130, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL),
(131, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL),
(132, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL),
(133, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 0, NULL),
(136, 4, 'minprocessor', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Processor', NULL, NULL, 0, 1, NULL, 0, NULL),
(137, 4, 'minmemory', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Memory', NULL, NULL, 0, 1, 'N/A', 0, NULL),
(138, 4, 'minstorage', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Storage', NULL, NULL, 0, 1, NULL, 1, NULL),
(139, 4, 'mingraphics', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Graphics Card', NULL, NULL, 0, 1, NULL, 1, NULL),
(140, 4, 'recprocessor', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Processor', NULL, NULL, 0, 1, NULL, 1, NULL),
(142, 4, 'recstorage', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Storage', NULL, NULL, 0, 1, NULL, 1, NULL),
(143, 4, 'recgraphics', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Graphics Card', NULL, NULL, 0, 1, NULL, 1, NULL),
(144, 4, 'recmemory', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Memory', NULL, NULL, 0, 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `default_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Default Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES
(1, 1, 'General', 1, 1),
(2, 2, 'General', 1, 1),
(3, 3, 'General', 10, 1),
(4, 3, 'General Information', 2, 0),
(5, 3, 'Display Settings', 20, 0),
(6, 3, 'Custom Design', 30, 0),
(7, 4, 'General', 1, 1),
(8, 4, 'Prices', 4, 0),
(9, 4, 'Meta Information', 5, 0),
(10, 4, 'Images', 6, 0),
(11, 4, 'Recurring Profile', 7, 0),
(12, 4, 'Design', 8, 0),
(13, 5, 'General', 1, 1),
(14, 6, 'General', 1, 1),
(15, 7, 'General', 1, 1),
(16, 8, 'General', 1, 1),
(17, 4, 'Gift Options', 9, 0),
(18, 4, 'Recomended Requirements', 2, 0),
(19, 4, 'Minimum Requirements', 3, 0),
(20, 9, 'Gift Options', 9, 0),
(21, 9, 'Design', 8, 0),
(22, 9, 'Recurring Profile', 7, 0),
(23, 9, 'Images', 5, 0),
(24, 9, 'Meta Information', 6, 0),
(25, 9, 'Prices', 4, 0),
(26, 9, 'Minimum Requirements', 2, 0),
(27, 9, 'Recomended Requirements', 3, 0),
(28, 9, 'General', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_label`
--

CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(10) UNSIGNED NOT NULL COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 18, 0),
(2, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_value`
--

CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_set`
--

CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';

--
-- Dumping data for table `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Custom', 1),
(2, 2, 'Custom', 1),
(3, 3, 'Custom', 1),
(4, 4, 'Default', 1),
(5, 5, 'Custom', 1),
(6, 6, 'Custom', 1),
(7, 7, 'Custom', 1),
(8, 8, 'Custom', 1),
(9, 4, 'Custom', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity`
--

CREATE TABLE `eav_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Parent Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Defines Is Entity Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_attribute`
--

CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';

--
-- Dumping data for table `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 0),
(3, 1, 1, 1, 3, 20),
(4, 1, 1, 1, 4, 30),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 50),
(7, 1, 1, 1, 7, 60),
(8, 1, 1, 1, 8, 70),
(9, 1, 1, 1, 9, 80),
(10, 1, 1, 1, 10, 25),
(11, 1, 1, 1, 11, 90),
(12, 1, 1, 1, 12, 0),
(13, 1, 1, 1, 13, 0),
(14, 1, 1, 1, 14, 0),
(15, 1, 1, 1, 15, 100),
(16, 1, 1, 1, 16, 0),
(17, 1, 1, 1, 17, 86),
(18, 1, 1, 1, 18, 110),
(19, 2, 2, 2, 19, 10),
(20, 2, 2, 2, 20, 20),
(21, 2, 2, 2, 21, 30),
(22, 2, 2, 2, 22, 40),
(23, 2, 2, 2, 23, 50),
(24, 2, 2, 2, 24, 60),
(25, 2, 2, 2, 25, 70),
(26, 2, 2, 2, 26, 80),
(27, 2, 2, 2, 27, 90),
(28, 2, 2, 2, 28, 100),
(29, 2, 2, 2, 29, 100),
(30, 2, 2, 2, 30, 110),
(31, 2, 2, 2, 31, 120),
(32, 2, 2, 2, 32, 130),
(33, 1, 1, 1, 33, 111),
(34, 1, 1, 1, 34, 112),
(35, 1, 1, 1, 35, 28),
(36, 2, 2, 2, 36, 140),
(37, 2, 2, 2, 37, 132),
(38, 2, 2, 2, 38, 133),
(39, 2, 2, 2, 39, 134),
(40, 2, 2, 2, 40, 135),
(41, 1, 1, 1, 41, 113),
(42, 1, 1, 1, 42, 114),
(43, 3, 3, 4, 43, 1),
(44, 3, 3, 4, 44, 2),
(45, 3, 3, 4, 45, 3),
(46, 3, 3, 4, 46, 4),
(47, 3, 3, 4, 47, 5),
(48, 3, 3, 4, 48, 6),
(49, 3, 3, 4, 49, 7),
(50, 3, 3, 4, 50, 8),
(51, 3, 3, 5, 51, 10),
(52, 3, 3, 5, 52, 20),
(53, 3, 3, 5, 53, 30),
(54, 3, 3, 4, 54, 12),
(55, 3, 3, 4, 55, 13),
(56, 3, 3, 4, 56, 14),
(57, 3, 3, 4, 57, 15),
(58, 3, 3, 4, 58, 16),
(59, 3, 3, 4, 59, 17),
(60, 3, 3, 6, 60, 10),
(61, 3, 3, 6, 61, 30),
(62, 3, 3, 6, 62, 40),
(63, 3, 3, 6, 63, 50),
(64, 3, 3, 6, 64, 60),
(65, 3, 3, 4, 65, 24),
(66, 3, 3, 4, 66, 25),
(67, 3, 3, 5, 67, 40),
(68, 3, 3, 5, 68, 50),
(69, 3, 3, 4, 69, 10),
(70, 3, 3, 6, 70, 5),
(71, 3, 3, 6, 71, 6),
(72, 3, 3, 5, 72, 51),
(90, 4, 4, 7, 91, 6),
(98, 4, 4, 7, 100, 11),
(99, 4, 4, 8, 101, 8),
(108, 4, 4, 7, 110, 13),
(110, 4, 4, 7, 112, 14),
(111, 4, 4, 7, 113, 15),
(112, 4, 4, 7, 114, 16),
(113, 4, 4, 7, 115, 17),
(114, 4, 4, 7, 116, 18),
(115, 4, 4, 7, 117, 19),
(116, 4, 4, 7, 118, 20),
(123, 4, 4, 7, 125, 22),
(124, 4, 4, 7, 126, 23),
(125, 4, 4, 7, 127, 24),
(127, 4, 4, 7, 129, 25),
(128, 4, 4, 7, 130, 26),
(129, 4, 4, 7, 131, 27),
(130, 4, 4, 7, 132, 28),
(131, 4, 4, 7, 133, 29),
(297, 4, 4, 7, 73, 1),
(299, 4, 4, 7, 74, 2),
(301, 4, 4, 7, 75, 3),
(303, 4, 4, 7, 76, 4),
(305, 4, 4, 7, 82, 5),
(307, 4, 4, 7, 95, 6),
(309, 4, 4, 7, 96, 7),
(311, 4, 4, 7, 98, 8),
(313, 4, 4, 7, 99, 9),
(315, 4, 4, 7, 104, 10),
(317, 4, 4, 7, 119, 11),
(323, 4, 4, 8, 77, 1),
(325, 4, 4, 8, 78, 3),
(327, 4, 4, 8, 79, 4),
(329, 4, 4, 8, 80, 5),
(331, 4, 4, 8, 81, 6),
(333, 4, 4, 8, 92, 2),
(335, 4, 4, 8, 93, 7),
(337, 4, 4, 8, 120, 8),
(339, 4, 4, 8, 121, 9),
(341, 4, 4, 8, 122, 10),
(343, 4, 4, 8, 123, 11),
(345, 4, 4, 8, 128, 12),
(347, 4, 4, 9, 84, 1),
(349, 4, 4, 9, 85, 2),
(351, 4, 4, 9, 86, 3),
(353, 4, 4, 10, 87, 1),
(355, 4, 4, 10, 88, 2),
(357, 4, 4, 10, 89, 3),
(359, 4, 4, 10, 90, 4),
(361, 4, 4, 10, 97, 5),
(363, 4, 4, 11, 102, 1),
(365, 4, 4, 11, 103, 2),
(367, 4, 4, 12, 105, 1),
(369, 4, 4, 12, 106, 2),
(371, 4, 4, 12, 107, 3),
(373, 4, 4, 12, 108, 4),
(375, 4, 4, 12, 109, 5),
(377, 4, 4, 12, 111, 6),
(379, 4, 4, 17, 124, 1),
(429, 4, 9, 25, 101, 8),
(451, 4, 9, 28, 91, 6),
(463, 4, 9, 28, 100, 11),
(467, 4, 9, 28, 110, 13),
(469, 4, 9, 28, 112, 14),
(471, 4, 9, 28, 113, 15),
(473, 4, 9, 28, 114, 16),
(475, 4, 9, 28, 115, 17),
(477, 4, 9, 28, 116, 18),
(479, 4, 9, 28, 117, 19),
(481, 4, 9, 28, 118, 20),
(483, 4, 9, 28, 125, 22),
(485, 4, 9, 28, 126, 23),
(487, 4, 9, 28, 127, 24),
(489, 4, 9, 28, 129, 25),
(491, 4, 9, 28, 130, 26),
(493, 4, 9, 28, 131, 27),
(495, 4, 9, 28, 132, 28),
(497, 4, 9, 28, 133, 29),
(595, 4, 9, 28, 73, 1),
(597, 4, 9, 28, 74, 2),
(599, 4, 9, 28, 75, 3),
(601, 4, 9, 28, 76, 4),
(603, 4, 9, 28, 82, 5),
(605, 4, 9, 28, 95, 6),
(607, 4, 9, 28, 96, 7),
(609, 4, 9, 28, 98, 8),
(611, 4, 9, 28, 99, 9),
(613, 4, 9, 28, 104, 10),
(615, 4, 9, 28, 119, 11),
(617, 4, 9, 26, 136, 1),
(619, 4, 9, 26, 137, 2),
(621, 4, 9, 26, 138, 4),
(623, 4, 9, 26, 139, 3),
(625, 4, 9, 27, 140, 1),
(627, 4, 9, 27, 142, 4),
(629, 4, 9, 27, 143, 3),
(631, 4, 9, 27, 144, 2),
(633, 4, 9, 25, 77, 1),
(635, 4, 9, 25, 78, 3),
(637, 4, 9, 25, 79, 4),
(639, 4, 9, 25, 80, 5),
(641, 4, 9, 25, 81, 6),
(643, 4, 9, 25, 92, 2),
(645, 4, 9, 25, 93, 7),
(647, 4, 9, 25, 120, 8),
(649, 4, 9, 25, 121, 9),
(651, 4, 9, 25, 122, 10),
(653, 4, 9, 25, 123, 11),
(655, 4, 9, 25, 128, 12),
(657, 4, 9, 23, 87, 1),
(659, 4, 9, 23, 88, 2),
(661, 4, 9, 23, 89, 3),
(663, 4, 9, 23, 90, 4),
(665, 4, 9, 23, 97, 5),
(667, 4, 9, 24, 84, 1),
(669, 4, 9, 24, 85, 2),
(671, 4, 9, 24, 86, 3),
(673, 4, 9, 22, 102, 1),
(675, 4, 9, 22, 103, 2),
(677, 4, 9, 21, 105, 1),
(679, 4, 9, 21, 106, 2),
(681, 4, 9, 21, 107, 3),
(683, 4, 9, 21, 108, 4),
(685, 4, 9, 21, 109, 5),
(687, 4, 9, 21, 111, 6),
(689, 4, 9, 20, 124, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_datetime`
--

CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_decimal`
--

CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_int`
--

CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_store`
--

CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';

--
-- Dumping data for table `eav_entity_store`
--

INSERT INTO `eav_entity_store` (`entity_store_id`, `entity_type_id`, `store_id`, `increment_prefix`, `increment_last_id`) VALUES
(1, 5, 1, '1', '100000003'),
(2, 6, 1, '1', '100000002');

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_text`
--

CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT '' COMMENT 'Increment Model',
  `increment_per_store` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) UNSIGNED NOT NULL DEFAULT 8 COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT '' COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'customer/customer', 'customer/attribute', 'customer/entity', NULL, NULL, 1, 'default', 1, 'eav/entity_increment_numeric', 0, 8, '0', 'customer/eav_attribute', 'customer/attribute_collection'),
(2, 'customer_address', 'customer/address', 'customer/attribute', 'customer/address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer/eav_attribute', 'customer/address_attribute_collection'),
(3, 'catalog_category', 'catalog/category', 'catalog/resource_eav_attribute', 'catalog/category', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog/eav_attribute', 'catalog/category_attribute_collection'),
(4, 'catalog_product', 'catalog/product', 'catalog/resource_eav_attribute', 'catalog/product', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog/eav_attribute', 'catalog/product_attribute_collection'),
(5, 'order', 'sales/order', NULL, 'sales/order', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'sales/order_invoice', NULL, 'sales/invoice', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'sales/order_creditmemo', NULL, 'sales/creditmemo', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'sales/order_shipment', NULL, 'sales/shipment', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_varchar`
--

CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_element`
--

CREATE TABLE `eav_form_element` (
  `element_id` int(10) UNSIGNED NOT NULL COMMENT 'Element Id',
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';

--
-- Dumping data for table `eav_form_element`
--

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, NULL, 20, 0),
(2, 1, NULL, 21, 1),
(3, 1, NULL, 22, 2),
(4, 1, NULL, 24, 3),
(5, 1, NULL, 9, 4),
(6, 1, NULL, 25, 5),
(7, 1, NULL, 26, 6),
(8, 1, NULL, 28, 7),
(9, 1, NULL, 30, 8),
(10, 1, NULL, 27, 9),
(11, 1, NULL, 31, 10),
(12, 1, NULL, 32, 11),
(13, 2, NULL, 20, 0),
(14, 2, NULL, 21, 1),
(15, 2, NULL, 22, 2),
(16, 2, NULL, 24, 3),
(17, 2, NULL, 9, 4),
(18, 2, NULL, 25, 5),
(19, 2, NULL, 26, 6),
(20, 2, NULL, 28, 7),
(21, 2, NULL, 30, 8),
(22, 2, NULL, 27, 9),
(23, 2, NULL, 31, 10),
(24, 2, NULL, 32, 11),
(25, 3, NULL, 20, 0),
(26, 3, NULL, 21, 1),
(27, 3, NULL, 22, 2),
(28, 3, NULL, 24, 3),
(29, 3, NULL, 25, 4),
(30, 3, NULL, 26, 5),
(31, 3, NULL, 28, 6),
(32, 3, NULL, 30, 7),
(33, 3, NULL, 27, 8),
(34, 3, NULL, 31, 9),
(35, 3, NULL, 32, 10),
(36, 4, NULL, 20, 0),
(37, 4, NULL, 21, 1),
(38, 4, NULL, 22, 2),
(39, 4, NULL, 24, 3),
(40, 4, NULL, 25, 4),
(41, 4, NULL, 26, 5),
(42, 4, NULL, 28, 6),
(43, 4, NULL, 30, 7),
(44, 4, NULL, 27, 8),
(45, 4, NULL, 31, 9),
(46, 4, NULL, 32, 10),
(47, 5, 1, 5, 0),
(48, 5, 1, 6, 1),
(49, 5, 1, 7, 2),
(50, 5, 1, 9, 3),
(51, 5, 2, 24, 0),
(52, 5, 2, 31, 1),
(53, 5, 2, 25, 2),
(54, 5, 2, 26, 3),
(55, 5, 2, 28, 4),
(56, 5, 2, 30, 5),
(57, 5, 2, 27, 6);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset`
--

CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Fieldset Id',
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';

--
-- Dumping data for table `eav_form_fieldset`
--

INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES
(1, 5, 'general', 1),
(2, 5, 'address', 2);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset_label`
--

CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

--
-- Dumping data for table `eav_form_fieldset_label`
--

INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES
(1, 0, 'Personal Information'),
(2, 0, 'Address Information');

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type`
--

CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';

--
-- Dumping data for table `eav_form_type`
--

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0),
(5, 'checkout_multishipping_register', 'checkout_multishipping_register', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type_entity`
--

CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `gift_message`
--

CREATE TABLE `gift_message` (
  `gift_message_id` int(10) UNSIGNED NOT NULL COMMENT 'GiftMessage Id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Recipient',
  `message` text DEFAULT NULL COMMENT 'Message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';

-- --------------------------------------------------------

--
-- Table structure for table `importexport_importdata`
--

CREATE TABLE `importexport_importdata` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext DEFAULT '' COMMENT 'Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';

-- --------------------------------------------------------

--
-- Table structure for table `index_event`
--

CREATE TABLE `index_event` (
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Event Id',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `entity` varchar(64) NOT NULL COMMENT 'Entity',
  `entity_pk` bigint(20) DEFAULT NULL COMMENT 'Entity Primary Key',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation Time',
  `old_data` mediumtext DEFAULT NULL COMMENT 'Old Data',
  `new_data` mediumtext DEFAULT NULL COMMENT 'New Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Event';

--
-- Dumping data for table `index_event`
--

INSERT INTO `index_event` (`event_id`, `type`, `entity`, `entity_pk`, `created_at`, `old_data`, `new_data`) VALUES
(1, 'save', 'catalog_category', 1, '2021-07-26 01:30:04', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(2, 'save', 'catalog_category', 2, '2021-07-26 01:30:04', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(3, 'save', 'cataloginventory_stock_item', 1, '2021-07-26 04:48:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(4, 'catalog_reindex_price', 'catalog_product', 1, '2021-07-26 04:48:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(5, 'save', 'catalog_product', 1, '2021-07-26 04:48:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(6, 'save', 'catalog_category', 3, '2021-07-26 04:59:54', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(7, 'save', 'core_config_data', 127, '2021-07-27 04:47:37', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(8, 'save', 'core_config_data', 134, '2021-07-27 04:47:37', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(9, 'save', 'core_config_data', 143, '2021-07-27 04:47:37', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(10, 'save', 'cataloginventory_stock_item', 2, '2021-07-30 05:58:29', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(11, 'catalog_reindex_price', 'catalog_product', 2, '2021-07-30 05:58:29', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(12, 'save', 'catalog_product', 2, '2021-07-30 05:58:29', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(13, 'save', 'cataloginventory_stock_item', 3, '2021-07-30 05:58:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(14, 'catalog_reindex_price', 'catalog_product', 3, '2021-07-30 05:58:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(15, 'save', 'catalog_product', 3, '2021-07-30 05:58:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(16, 'save', 'cataloginventory_stock_item', 4, '2021-08-01 19:48:04', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(17, 'catalog_reindex_price', 'catalog_product', 4, '2021-08-01 19:48:04', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(18, 'save', 'catalog_product', 4, '2021-08-01 19:48:05', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(19, 'save', 'catalog_category', 4, '2021-08-01 20:52:47', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(20, 'save', 'catalog_category', 5, '2021-08-01 21:04:12', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(21, 'save', 'store_group', 1, '2021-08-01 21:04:35', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(22, 'save', 'cataloginventory_stock_item', 5, '2021-08-01 22:14:49', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(23, 'catalog_reindex_price', 'catalog_product', 5, '2021-08-01 22:14:49', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(24, 'save', 'catalog_product', 5, '2021-08-01 22:14:49', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(25, 'save', 'catalog_category', 6, '2021-08-02 00:28:23', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(26, 'save', 'catalog_category', 7, '2021-08-02 00:58:45', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(27, 'save', 'catalog_category', 8, '2021-08-02 00:59:08', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(28, 'save', 'catalog_category', 9, '2021-08-02 01:11:12', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(29, 'save', 'catalog_category', 10, '2021-08-02 01:12:30', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(30, 'mass_action', 'catalog_product', NULL, '2021-08-02 01:20:00', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(31, 'save', 'catalog_eav_attribute', 75, '2021-08-13 01:26:48', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(32, 'save', 'catalog_eav_attribute', 134, '2021-08-13 01:28:25', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(33, 'save', 'catalog_eav_attribute', 135, '2021-08-13 04:18:30', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(34, 'delete', 'catalog_eav_attribute', 135, '2021-08-15 23:54:05', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";s:1:\"0\";}'),
(35, 'delete', 'catalog_eav_attribute', 134, '2021-08-15 23:54:19', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";s:1:\"0\";}'),
(36, 'save', 'catalog_eav_attribute', 136, '2021-08-15 23:55:06', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(37, 'save', 'catalog_eav_attribute', 137, '2021-08-15 23:58:19', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(38, 'save', 'catalog_eav_attribute', 138, '2021-08-15 23:59:21', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(39, 'save', 'catalog_eav_attribute', 139, '2021-08-16 00:00:12', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(40, 'save', 'catalog_eav_attribute', 140, '2021-08-16 00:00:47', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(41, 'save', 'catalog_eav_attribute', 141, '2021-08-16 00:01:19', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(42, 'save', 'catalog_eav_attribute', 142, '2021-08-16 00:01:41', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(43, 'save', 'catalog_eav_attribute', 143, '2021-08-16 00:02:13', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(44, 'delete', 'catalog_eav_attribute', 141, '2021-08-16 00:04:34', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";s:1:\"0\";}'),
(45, 'save', 'catalog_eav_attribute', 144, '2021-08-16 00:04:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(46, 'delete', 'catalog_product', 1, '2021-08-16 00:22:39', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(47, 'delete', 'catalog_product', 2, '2021-08-16 00:22:40', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(48, 'delete', 'catalog_product', 3, '2021-08-16 00:22:41', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(49, 'delete', 'catalog_product', 4, '2021-08-16 00:22:42', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(50, 'delete', 'catalog_product', 5, '2021-08-16 00:22:43', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(51, 'save', 'catalog_eav_attribute', 82, '2021-08-16 00:26:12', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(52, 'save', 'cataloginventory_stock_item', 6, '2021-08-16 00:27:32', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(53, 'catalog_reindex_price', 'catalog_product', 6, '2021-08-16 00:27:32', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(54, 'save', 'catalog_product', 6, '2021-08-16 00:27:32', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(55, 'save', 'catalog_category', 11, '2021-08-16 04:13:08', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(56, 'save', 'catalog_category', 12, '2021-08-16 04:13:36', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(57, 'save', 'cataloginventory_stock_item', 7, '2021-09-09 04:12:45', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(58, 'catalog_reindex_price', 'catalog_product', 7, '2021-09-09 04:12:45', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(59, 'save', 'catalog_product', 7, '2021-09-09 04:12:45', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(60, 'save', 'catalog_category', 13, '2021-09-09 04:38:10', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(61, 'delete', 'catalog_product', 6, '2021-09-09 04:42:48', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(62, 'save', 'cataloginventory_stock_item', 8, '2021-09-09 04:43:40', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(63, 'catalog_reindex_price', 'catalog_product', 8, '2021-09-09 04:43:41', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(64, 'save', 'catalog_product', 8, '2021-09-09 04:43:41', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(65, 'save', 'catalog_eav_attribute', 76, '2021-09-09 19:09:03', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(66, 'save', 'cataloginventory_stock_item', 9, '2021-09-09 19:09:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(67, 'catalog_reindex_price', 'catalog_product', 9, '2021-09-09 19:09:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(68, 'save', 'catalog_product', 9, '2021-09-09 19:09:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(69, 'save', 'cataloginventory_stock_item', 10, '2021-09-09 19:28:03', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(70, 'catalog_reindex_price', 'catalog_product', 10, '2021-09-09 19:28:03', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(71, 'save', 'catalog_product', 10, '2021-09-09 19:28:03', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(72, 'save', 'cataloginventory_stock_item', 11, '2021-09-09 19:34:29', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(73, 'catalog_reindex_price', 'catalog_product', 11, '2021-09-09 19:34:29', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(74, 'save', 'catalog_product', 11, '2021-09-09 19:34:29', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(75, 'save', 'cataloginventory_stock_item', 12, '2021-09-09 19:42:21', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(76, 'catalog_reindex_price', 'catalog_product', 12, '2021-09-09 19:42:21', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(77, 'save', 'catalog_product', 12, '2021-09-09 19:42:22', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(78, 'save', 'catalog_category', 14, '2021-09-09 20:45:50', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(79, 'save', 'cataloginventory_stock_item', 13, '2021-09-09 21:42:31', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(80, 'catalog_reindex_price', 'catalog_product', 13, '2021-09-09 21:42:31', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(81, 'save', 'catalog_product', 13, '2021-09-09 21:42:31', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(82, 'save', 'cataloginventory_stock_item', 14, '2021-09-09 22:02:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(83, 'catalog_reindex_price', 'catalog_product', 14, '2021-09-09 22:02:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(84, 'save', 'catalog_product', 14, '2021-09-09 22:02:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(85, 'save', 'cataloginventory_stock_item', 15, '2021-09-09 22:06:49', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(86, 'catalog_reindex_price', 'catalog_product', 15, '2021-09-09 22:06:49', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(87, 'save', 'catalog_product', 15, '2021-09-09 22:06:49', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(88, 'save', 'core_config_data', 132, '2021-10-11 00:31:02', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(89, 'save', 'core_config_data', 133, '2021-10-11 00:31:02', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `index_process`
--

CREATE TABLE `index_process` (
  `process_id` int(10) UNSIGNED NOT NULL COMMENT 'Process Id',
  `indexer_code` varchar(32) NOT NULL COMMENT 'Indexer Code',
  `status` varchar(15) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT 'Ended At',
  `mode` varchar(9) NOT NULL DEFAULT 'real_time' COMMENT 'Mode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process';

--
-- Dumping data for table `index_process`
--

INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES
(1, 'catalog_product_attribute', 'pending', '2021-11-18 18:27:58', '2021-11-18 18:27:58', 'real_time'),
(2, 'catalog_product_price', 'pending', '2021-11-18 18:27:58', '2021-11-18 18:27:59', 'real_time'),
(3, 'catalog_url', 'pending', '2021-11-18 18:27:59', '2021-11-18 18:27:59', 'real_time'),
(4, 'catalog_product_flat', 'pending', '2021-07-27 05:09:32', '2021-07-27 05:09:32', 'real_time'),
(5, 'catalog_category_flat', 'pending', '2021-07-27 05:09:32', '2021-07-27 05:09:32', 'real_time'),
(6, 'catalog_category_product', 'pending', '2021-11-18 18:27:59', '2021-11-18 18:27:59', 'real_time'),
(7, 'catalogsearch_fulltext', 'pending', '2021-11-18 18:27:59', '2021-11-18 18:27:59', 'real_time'),
(8, 'cataloginventory_stock', 'pending', '2021-11-18 18:27:58', '2021-11-18 18:27:58', 'real_time'),
(9, 'tag_summary', 'pending', '2021-11-18 18:27:59', '2021-11-18 18:27:59', 'real_time');

-- --------------------------------------------------------

--
-- Table structure for table `index_process_event`
--

CREATE TABLE `index_process_event` (
  `process_id` int(10) UNSIGNED NOT NULL COMMENT 'Process Id',
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Event Id',
  `status` varchar(7) NOT NULL DEFAULT 'new' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process Event';

-- --------------------------------------------------------

--
-- Table structure for table `log_customer`
--

CREATE TABLE `log_customer` (
  `log_id` int(10) UNSIGNED NOT NULL COMMENT 'Log ID',
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `login_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Login Time',
  `logout_at` timestamp NULL DEFAULT NULL COMMENT 'Logout Time',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Customers Table';

-- --------------------------------------------------------

--
-- Table structure for table `log_quote`
--

CREATE TABLE `log_quote` (
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quote ID',
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation Time',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Deletion Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Quotes Table';

--
-- Dumping data for table `log_quote`
--

INSERT INTO `log_quote` (`quote_id`, `visitor_id`, `created_at`, `deleted_at`) VALUES
(1, 24, '2021-07-29 07:03:55', NULL),
(2, 27, '2021-07-29 19:53:56', NULL),
(3, 31, '2021-07-29 22:34:52', NULL),
(5, 47, '2021-08-02 03:17:51', NULL),
(9, 69, '2021-09-09 21:44:43', NULL),
(10, 87, '2021-09-13 04:25:45', NULL),
(11, 95, '2021-09-20 22:44:41', NULL),
(12, 96, '2021-09-21 00:40:33', NULL),
(13, 108, '2021-09-23 04:16:26', NULL),
(14, 158, '2021-10-20 05:37:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_summary`
--

CREATE TABLE `log_summary` (
  `summary_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Summary ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `type_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Type ID',
  `visitor_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Visitor Count',
  `customer_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Customer Count',
  `add_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Table';

-- --------------------------------------------------------

--
-- Table structure for table `log_summary_type`
--

CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type ID',
  `type_code` varchar(64) DEFAULT NULL COMMENT 'Type Code',
  `period` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Period',
  `period_type` varchar(6) NOT NULL DEFAULT 'MINUTE' COMMENT 'Period Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Types Table';

--
-- Dumping data for table `log_summary_type`
--

INSERT INTO `log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES
(1, 'hour', 1, 'HOUR'),
(2, 'day', 1, 'DAY');

-- --------------------------------------------------------

--
-- Table structure for table `log_url`
--

CREATE TABLE `log_url` (
  `url_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'URL ID',
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `visit_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Visit Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Table';

-- --------------------------------------------------------

--
-- Table structure for table `log_url_info`
--

CREATE TABLE `log_url_info` (
  `url_id` bigint(20) UNSIGNED NOT NULL COMMENT 'URL ID',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `referer` varchar(255) DEFAULT NULL COMMENT 'Referrer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Info Table';

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor`
--

CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Visitor ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last Visit Time',
  `last_url_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Last URL ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitors Table';

--
-- Dumping data for table `log_visitor`
--

INSERT INTO `log_visitor` (`visitor_id`, `session_id`, `first_visit_at`, `last_visit_at`, `last_url_id`, `store_id`) VALUES
(1, 'oed5gj025s2vosl982posjosee', '2021-07-26 01:31:17', '2021-07-26 02:03:23', 0, 1),
(2, '8k6ebqevc39nl1lp1ilp56h2q3', '2021-07-26 03:49:30', '2021-07-26 05:19:35', 0, 1),
(3, 'fsk6404j4eb3qghkcckr2ukkli', '2021-07-26 03:49:58', '2021-07-26 03:49:59', 0, 1),
(4, 'hvm7fm12odo0ire9qd7039jjc5', '2021-07-26 04:47:00', '2021-07-26 04:47:00', 0, 1),
(5, '9kvkc7iu4evpoljsl89t6g521e', '2021-07-26 19:02:27', '2021-07-26 19:20:00', 0, 1),
(6, 'aihrttun0mpag5fb1c2hd6nkef', '2021-07-26 22:52:54', '2021-07-26 22:52:54', 0, 1),
(7, 'ssikp3phmeuedi09c7u4av75p6', '2021-07-26 22:53:19', '2021-07-26 23:38:08', 0, 1),
(8, 'dqgh5i2gqr6hv25jk8tan6s4sp', '2021-07-26 23:37:48', '2021-07-26 23:37:48', 0, 1),
(9, 'tlcumph6in3pa3gj08relbsl4d', '2021-07-26 23:37:49', '2021-07-26 23:37:49', 0, 1),
(10, '88fdsl4fhv3duthvbcb611ajh2', '2021-07-26 23:37:49', '2021-07-26 23:37:49', 0, 1),
(11, 'vkt4k04beulj31j1dialcg830g', '2021-07-26 23:37:49', '2021-07-26 23:37:49', 0, 1),
(12, 'q5uve49haalijergd76hi7kffn', '2021-07-26 23:37:49', '2021-07-26 23:37:50', 0, 1),
(13, 'me2fn3nh7a0nnlmjip9s9a75aj', '2021-07-26 23:37:50', '2021-07-26 23:37:50', 0, 1),
(14, 'r79mu2kpvfbgve0bm8fgc2d49a', '2021-07-26 23:37:50', '2021-07-26 23:37:50', 0, 1),
(15, '71lsl9k2h8robgrecinsjtdtpf', '2021-07-26 23:37:50', '2021-07-26 23:37:50', 0, 1),
(16, 'k4t3a98hd99q9u3c3as469t5de', '2021-07-26 23:37:50', '2021-07-26 23:37:51', 0, 1),
(17, 'm01e61hlovl4rao17do00ujnn3', '2021-07-26 23:37:51', '2021-07-26 23:37:51', 0, 1),
(18, 'onedt7ub7rh8be9oaui00d4768', '2021-07-26 23:37:51', '2021-07-26 23:37:51', 0, 1),
(19, 'ab8h32fi93l1egtc575e3bjjtf', '2021-07-26 23:37:51', '2021-07-26 23:37:51', 0, 1),
(20, '54j9m2jv56gop11jg07qfussvh', '2021-07-27 04:21:50', '2021-07-27 05:40:33', 0, 1),
(21, '2d5uhc65ipqc5gnqcdnqji9g0l', '2021-07-27 05:20:25', '2021-07-27 05:20:26', 0, 1),
(22, 'slj9absram14o7gq2tbnegddd4', '2021-07-27 19:07:40', '2021-07-27 19:07:43', 0, 1),
(23, 'j9lk4cb510klbss57iv0gpql4t', '2021-07-28 23:42:33', '2021-07-29 00:02:10', 0, 1),
(24, 'blvsceh4huj4qps9tt16v5sej9', '2021-07-29 05:39:08', '2021-07-29 07:08:03', 0, 1),
(25, 'bj0d73llc1flop4sli74q0cid4', '2021-07-29 05:49:56', '2021-07-29 05:49:56', 0, 1),
(26, 'vh6sr3sdtg8e6aicqql4v49s9c', '2021-07-29 06:13:41', '2021-07-29 06:13:41', 0, 1),
(27, 'eet21qud57a4bqkci6dbjvug9e', '2021-07-29 19:27:28', '2021-07-29 20:11:57', 0, 1),
(28, 'j5fkljpilqe6lh59l8s9j3pjm4', '2021-07-29 19:38:26', '2021-07-29 19:38:27', 0, 1),
(29, 'kqn3h76ee7046raavivmgam09e', '2021-07-29 20:09:55', '2021-07-29 20:09:55', 0, 1),
(30, 'f1g45k91kjgvoj6u2132dvhf0r', '2021-07-29 20:11:30', '2021-07-29 20:11:30', 0, 1),
(31, '1ukoabf0dpr5pn427nbu779vup', '2021-07-29 21:36:53', '2021-07-29 22:35:42', 0, 1),
(32, 'cptrhiec1dl68e5t2fl0ke9gvm', '2021-07-30 00:06:16', '2021-07-30 00:10:00', 0, 1),
(33, 'gf29ed3nl907c1l3h7gijqp3ur', '2021-07-30 01:22:25', '2021-07-30 06:08:33', 0, 1),
(34, 'cjdf9hmo26dulhg8o8jpi2up4r', '2021-07-30 02:30:03', '2021-07-30 02:30:03', 0, 1),
(35, 'tu667isnqinrlu9djhpifvnunn', '2021-07-30 02:41:04', '2021-07-30 02:41:04', 0, 1),
(36, '7vep1cgrb39543l58bs43ku5d2', '2021-07-30 04:35:46', '2021-07-30 04:35:46', 0, 1),
(37, '7mo7q5tsqp7uknpohof5s444a8', '2021-07-31 06:45:20', '2021-07-31 06:48:15', 0, 1),
(38, 'tdoobr9eon3e04m66rv04g7p25', '2021-08-01 05:34:54', '2021-08-01 05:35:11', 0, 1),
(39, 'dd2j5ksa4eeqsapvaff0eutolu', '2021-08-01 19:14:42', '2021-08-02 00:06:42', 0, 1),
(40, 'ict395ta1kp8d748gh9vma5l35', '2021-08-01 19:16:11', '2021-08-01 19:16:12', 0, 1),
(41, 'otsirh6g6j8ptp535ikgu6i4qq', '2021-08-01 19:29:32', '2021-08-01 19:29:33', 0, 1),
(42, 't83jjdvr0h5av5ktp63lkj6e3a', '2021-08-01 20:18:06', '2021-08-01 20:18:06', 0, 1),
(43, '4bhhoqgt1irnbkh8rc74le8odq', '2021-08-01 20:51:08', '2021-08-01 20:51:09', 0, 1),
(44, 'tmdo3vttuel7v87k1ve5v6l0ka', '2021-08-01 21:23:54', '2021-08-01 21:23:54', 0, 1),
(45, 'fhs9epsn1ubeouj544ie9f9v92', '2021-08-01 23:11:11', '2021-08-01 23:11:12', 0, 1),
(46, '4obo3pgj3f0jufn32b7mmcdjmf', '2021-08-02 00:06:42', '2021-08-02 01:42:12', 0, 1),
(47, 'rc8sklgudemfc3tf1v8kov3p6e', '2021-08-02 01:42:13', '2021-08-02 03:30:20', 0, 1),
(48, 'jpvcjnce7q2cqore4sc3ndu6q1', '2021-08-02 02:11:08', '2021-08-02 02:11:08', 0, 1),
(49, 'flc2urhirnqpo7r2unba5g47ne', '2021-08-02 02:23:29', '2021-08-02 02:23:29', 0, 1),
(50, '0mmb7f6pspo60ehnamhn6kgdqq', '2021-08-02 02:39:54', '2021-08-02 02:39:54', 0, 1),
(51, '03gjbs2cpsr0f146fa6vphmoej', '2021-08-02 18:56:58', '2021-08-02 18:57:38', 0, 1),
(52, '6oa670jq6glvcquv9ldsgae3p1', '2021-08-12 23:52:47', '2021-08-13 01:29:52', 0, 1),
(53, '7vl2lqhlegavh36lj308ac6adc', '2021-08-13 01:29:52', '2021-08-13 01:54:28', 0, 1),
(54, '427lsmb22a7e2f27pi1s9irgsf', '2021-08-13 03:57:09', '2021-08-13 04:52:37', 0, 1),
(55, 'qefgq9a7s0fsb7a4lhh4ubsuoj', '2021-08-15 23:38:13', '2021-08-16 01:29:38', 0, 1),
(56, 'aifrvc7fifchspldtnq5k7fnso', '2021-08-16 01:03:22', '2021-08-16 01:03:22', 0, 1),
(57, 'ujd9ne30rs5q4t4i7die43pvde', '2021-08-16 01:15:04', '2021-08-16 01:15:05', 0, 1),
(58, 'vb43pnl6qetnkoocmeodrdsmt7', '2021-08-16 03:11:07', '2021-08-16 04:35:24', 0, 1),
(59, 'al1sa3kio4h3tafingtag772e6', '2021-09-08 21:41:38', '2021-09-09 00:49:41', 0, 1),
(60, 'h562cs7ggbpht0cg411tp47n7e', '2021-09-08 21:43:09', '2021-09-08 21:43:09', 0, 1),
(61, 'k27t4bv625fegscsciekr077vp', '2021-09-08 23:36:33', '2021-09-08 23:36:33', 0, 1),
(62, 'khvhiipl28ou9eur1ks73sq11c', '2021-09-09 03:46:26', '2021-09-09 06:12:57', 0, 1),
(63, 'qq0i4iscitvc8pe587am4utgin', '2021-09-09 04:29:16', '2021-09-09 04:29:16', 0, 1),
(64, 'uesmaitco6p2qg7nflgk99absk', '2021-09-09 06:07:19', '2021-09-09 06:07:20', 0, 1),
(65, 'p05a1uc45j4a7ho6bb4ltffj0u', '2021-09-09 18:41:32', '2021-09-09 21:36:38', 0, 1),
(66, '301kl3g3clfvloh79sflabtdq7', '2021-09-09 19:01:12', '2021-09-09 19:01:12', 0, 1),
(67, 'fs5krs9tkkf46dkd9ttrs6dm0i', '2021-09-09 19:38:01', '2021-09-09 19:38:01', 0, 1),
(68, 'qr1td06qvs8f8ecdp63ud6fknn', '2021-09-09 20:46:07', '2021-09-09 20:46:07', 0, 1),
(69, 'd9h0r96v40e8rpsqb3peakdg7e', '2021-09-09 21:36:38', '2021-09-10 00:19:16', 0, 1),
(70, 'tt26gfuek1ckvnqlgcnf4vpu9d', '2021-09-09 22:03:13', '2021-09-09 22:03:13', 0, 1),
(71, 'qdu43m4bnjaf5tdpsb7f5p29ol', '2021-09-09 22:28:31', '2021-09-09 22:28:31', 0, 1),
(72, 'bujo32l7454eplm3hidaj4c1cn', '2021-09-09 23:10:18', '2021-09-09 23:10:19', 0, 1),
(73, 'j82kie06gak2f2hfgbmd5cf3sd', '2021-09-09 23:11:59', '2021-09-09 23:11:59', 0, 1),
(74, 'htij8h7f75lfm2b6mdonm0hmhk', '2021-09-09 23:12:55', '2021-09-09 23:12:55', 0, 1),
(75, '3oh151cjqq4lgr4c3fjb8atehl', '2021-09-09 23:15:28', '2021-09-09 23:15:28', 0, 1),
(76, '59q51iggup6tv2mvjqnirg4cqk', '2021-09-09 23:21:46', '2021-09-09 23:21:46', 0, 1),
(77, 'svud268fcs2p0qumj319t5tsai', '2021-09-09 23:21:59', '2021-09-09 23:22:00', 0, 1),
(78, '2rg47apsht18nqocmhiqfbu861', '2021-09-09 23:36:44', '2021-09-09 23:36:44', 0, 1),
(79, 'o51a1afd03qi47dvbmpmcq9v2e', '2021-09-10 00:16:43', '2021-09-10 00:18:31', 0, 1),
(80, 'vg9t1gnjplbcnpvku3aj65r11c', '2021-09-10 03:23:13', '2021-09-10 05:38:37', 0, 1),
(81, 'ddiffajuph5een0k22ljblcilq', '2021-09-10 03:44:06', '2021-09-10 03:44:07', 0, 1),
(82, 'st97ukfeaolaqsgmoo24n240je', '2021-09-10 03:53:41', '2021-09-10 03:53:41', 0, 1),
(83, 'b5e657mvrl09umrg218n594a4l', '2021-09-10 03:59:59', '2021-09-10 03:59:59', 0, 1),
(84, 'qtjttpq7hlalt95n7457vbvs8e', '2021-09-10 04:24:35', '2021-09-10 04:24:35', 0, 1),
(85, 'v4i891qbn9nanpv0q4cdh601nd', '2021-09-10 04:52:35', '2021-09-10 04:52:36', 0, 1),
(86, 'cf1fd0orifssk0vuunu5gn11v9', '2021-09-10 05:18:57', '2021-09-10 05:18:58', 0, 1),
(87, 'rk8cqluibi0idbfmr56rrti7hl', '2021-09-13 04:03:51', '2021-09-13 04:42:23', 0, 1),
(88, 'uagv9k6mnr76ireb69labqtekl', '2021-09-13 04:15:46', '2021-09-13 04:15:46', 0, 1),
(89, 'f9rth591bfi9s6lkalgfii8v4q', '2021-09-13 04:19:56', '2021-09-13 04:19:56', 0, 1),
(90, 'eenm3qn5pmdk7s35irre3hh2h0', '2021-09-13 04:21:31', '2021-09-13 04:21:31', 0, 1),
(91, 'q1svvaqtpii5eaiubd20or3kbr', '2021-09-13 04:31:39', '2021-09-13 04:31:39', 0, 1),
(92, 'sjujiijkbnie3er1sh9m5falqs', '2021-09-14 03:07:59', '2021-09-14 03:34:53', 0, 1),
(93, '5nen316r3ka9r6e48pkt1idclb', '2021-09-14 03:11:26', '2021-09-14 03:11:27', 0, 1),
(94, '8ebpcbmvr7n23tmm5559r90rse', '2021-09-14 03:15:51', '2021-09-14 03:15:52', 0, 1),
(95, 'nqph1k20d86hs73gfi8f2jfdp3', '2021-09-20 22:35:56', '2021-09-20 22:54:24', 0, 1),
(96, 'oee0esja29bkisuh1ble6ivej1', '2021-09-21 00:40:02', '2021-09-21 01:47:02', 0, 1),
(97, 'h293b706pch192tvomm48imgh9', '2021-09-21 00:43:45', '2021-09-21 00:43:45', 0, 1),
(98, 'h293b706pch192tvomm48imgh9', '2021-09-21 00:43:45', '2021-09-21 01:03:43', 0, 1),
(99, 'd1p06q2ufknpju1m4llh1d3c9r', '2021-09-21 01:21:57', '2021-09-21 01:21:58', 0, 1),
(100, '97up8l7dcek9gefui44rrv9oiv', '2021-09-21 01:43:14', '2021-09-21 01:43:14', 0, 1),
(101, '16g6aqtpth155a4eiqo8qq7nch', '2021-09-21 01:43:14', '2021-09-21 01:43:14', 0, 1),
(102, '1vg81q2t8drsbmicmkufo3eshk', '2021-09-21 04:37:05', '2021-09-21 04:37:06', 0, 1),
(103, '3ofbqsdor1kdga9aiqm8ct39un', '2021-09-21 04:37:06', '2021-09-21 04:49:23', 0, 1),
(104, '71vkofoapdtaj439tj08jv625t', '2021-09-21 04:38:02', '2021-09-21 06:08:04', 0, 1),
(105, 'gide40qljj8duh2ebvf3hqn4t3', '2021-09-21 04:38:13', '2021-09-21 04:38:14', 0, 1),
(106, '75lel1shehf3r57gn7svgpu7jk', '2021-09-21 05:40:05', '2021-09-21 05:40:05', 0, 1),
(107, 'nmiqctr3uu2459tf7queer8oa4', '2021-09-21 05:40:05', '2021-09-21 05:40:05', 0, 1),
(108, 'j6j19obfgd0f39vu5em8ukg1tc', '2021-09-23 04:15:00', '2021-09-23 06:18:23', 0, 1),
(109, 'pvjcd84omi1b51ich3lhomv6t6', '2021-09-23 05:16:40', '2021-09-23 05:16:40', 0, 1),
(110, '4m2aghpn8dkd2nktf94oletcgi', '2021-09-23 17:59:23', '2021-09-23 18:18:07', 0, 1),
(111, 'u6452712ofrglecda0c488882v', '2021-09-23 18:18:17', '2021-09-23 18:18:18', 0, 1),
(112, '9gcncfc7ssjpb7jnes83s22tjj', '2021-09-24 02:21:43', '2021-09-24 02:21:45', 0, 1),
(113, '8cvommocq7qhg8bcobjo9hdf76', '2021-09-24 03:32:04', '2021-09-24 04:26:59', 0, 1),
(114, '5iu49vmhaagulp6hl8ks6r3cks', '2021-09-24 03:32:20', '2021-09-24 03:32:21', 0, 1),
(115, 'akc82ffm60la398nknpti3mqoj', '2021-09-24 04:17:30', '2021-09-24 04:17:30', 0, 1),
(116, 'hu5adkonla9slburt2i7ofler6', '2021-09-26 22:04:09', '2021-09-26 23:32:12', 0, 1),
(117, 'q7rtkpb9skdrnf583ngnidchc2', '2021-09-26 22:05:25', '2021-09-26 22:05:26', 0, 1),
(118, '1gc95t636biort778m8cftqqvs', '2021-09-26 23:30:35', '2021-09-26 23:30:35', 0, 1),
(119, 'ljh9aperdtdv27csdnnarhfog7', '2021-09-27 05:43:39', '2021-09-27 06:31:17', 0, 1),
(120, 'ot9fojcnmmp1nqj9e1ajjfdmm6', '2021-09-27 05:45:19', '2021-09-27 05:45:19', 0, 1),
(121, '8s90am3n1b5h00k40qv6q04g3q', '2021-09-27 05:52:35', '2021-09-27 05:52:36', 0, 1),
(122, 'pb6m56fubc5dfl1ashenuhrt62', '2021-09-27 06:03:56', '2021-09-27 06:03:56', 0, 1),
(123, 'ljfjaim4g47e1005vv8hiukte1', '2021-10-07 18:42:54', '2021-10-07 18:49:37', 0, 1),
(124, 'kl1g4s8botqtsb4l7hur84cui3', '2021-10-07 18:43:10', '2021-10-07 18:43:11', 0, 1),
(125, 'jh3vq7s4bd12al42lq67bfg53v', '2021-10-07 20:34:54', '2021-10-07 20:34:55', 0, 1),
(126, 'pnk5i0f7sk46m19sou7ifjbjk5', '2021-10-10 19:14:20', '2021-10-10 20:12:05', 0, 1),
(127, 'onpkhrof6ipk3adgjgor7b2es0', '2021-10-10 19:14:42', '2021-10-10 19:14:42', 0, 1),
(128, '0r3g58490mmmak6p08k192hoaa', '2021-10-10 19:54:32', '2021-10-10 19:54:32', 0, 1),
(129, 'r6fik2oq9corgq7smrv8ati964', '2021-10-10 21:37:57', '2021-10-10 22:29:30', 0, 1),
(130, 'ptpc81tmsj63h4p4kh819t3uj5', '2021-10-10 21:43:17', '2021-10-10 21:43:18', 0, 1),
(131, '1cad00uejjua18daa12p16nm0r', '2021-10-10 22:13:52', '2021-10-10 22:13:52', 0, 1),
(132, 'b5ujb4lnq4vpfmh4dlqaj1sf85', '2021-10-10 23:48:43', '2021-10-11 00:54:35', 0, 1),
(133, 'j89a4o5bbtpck32mkrtcfso2n0', '2021-10-10 23:49:02', '2021-10-10 23:49:02', 0, 1),
(134, '83sp3olerhvbr3i3p6b5api6l7', '2021-10-11 00:52:56', '2021-10-11 00:52:57', 0, 1),
(135, 'phpp507pdc2rn1rosb90ab2tcl', '2021-10-11 00:53:12', '2021-10-11 00:53:12', 0, 1),
(136, 'tneg8qqbuoevq7g0121qqjap7p', '2021-10-11 00:54:17', '2021-10-11 00:54:18', 0, 1),
(137, 'fibjgj2oq50orbie889b33qst8', '2021-10-11 04:18:49', '2021-10-11 05:09:15', 0, 1),
(138, 'tcmgrnfbr2ren8ip3a1gln5fii', '2021-10-11 04:27:13', '2021-10-11 04:27:14', 0, 1),
(139, 'h1q74pd43rqneaqbjvco1a8ns9', '2021-10-11 04:30:15', '2021-10-11 04:30:15', 0, 1),
(140, 'l5rr8gl3nv5r6ths8ju3tm33r0', '2021-10-11 04:33:53', '2021-10-11 04:33:53', 0, 1),
(141, '3n9s1lkvqu2ht1r2015d3umgnm', '2021-10-11 04:34:09', '2021-10-11 04:34:13', 0, 1),
(142, 'btr37kbj4g55vulc54bk5ekhum', '2021-10-11 18:57:36', '2021-10-11 18:57:50', 0, 1),
(143, '1f8j0lpganr9hltps2ssgn9as0', '2021-10-12 05:57:31', '2021-10-12 06:33:04', 0, 1),
(144, '5rhs2tkb7d05l915kogei3i2nf', '2021-10-12 06:18:37', '2021-10-12 06:18:37', 0, 1),
(145, 'fcme5khjeoit2aan5podqnh1so', '2021-10-14 06:56:23', '2021-10-14 06:59:55', 0, 1),
(146, 'gh8f39inhm6dl9pbk9pulok5as', '2021-10-17 23:23:11', '2021-10-18 01:23:56', 0, 1),
(147, 'v9hj9fqvga54cofso1ph1c803b', '2021-10-17 23:59:32', '2021-10-17 23:59:32', 0, 1),
(148, 'mjvat3sbg95u1aphu0lnj4ooq8', '2021-10-18 00:26:18', '2021-10-18 00:26:18', 0, 1),
(149, '3l4rglggf0d96md6v7nr98j332', '2021-10-18 01:08:25', '2021-10-18 01:08:25', 0, 1),
(150, 'a14kc6pa34slc21cj4rc1jjppi', '2021-10-18 04:00:36', '2021-10-18 05:11:07', 0, 1),
(151, 'spsj8cf0pce86gvdc8jrq3s7ta', '2021-10-18 05:12:48', '2021-10-18 05:45:27', 0, 1),
(152, '8uguaugce1q7vqar6pp2osn0ak', '2021-10-18 05:14:40', '2021-10-18 05:14:40', 0, 1),
(153, 'gaj0dq5t3vni0vjtrmrlh69gnm', '2021-10-19 22:03:57', '2021-10-19 23:22:57', 0, 1),
(154, '2nsla01e76arjeiuifseguctr4', '2021-10-19 22:04:26', '2021-10-19 22:04:27', 0, 1),
(155, 'jaqgvi7hj8sljal95og6bek535', '2021-10-19 22:33:15', '2021-10-19 22:33:15', 0, 1),
(156, 'q09auq0hbb631qht2juesfqj75', '2021-10-19 23:01:46', '2021-10-19 23:01:46', 0, 1),
(157, '462p5aa4mdk5tdojg03pjio4ar', '2021-10-20 04:07:50', '2021-10-20 04:07:51', 0, 1),
(158, 'br9rhukohhiarro643rdlu0bmb', '2021-10-20 05:15:17', '2021-10-20 05:38:55', 0, 1),
(159, 'mh903u9tqbeig2v5gmndn6bim0', '2021-10-20 05:19:35', '2021-10-20 05:19:36', 0, 1),
(160, '0dmdvihp560tl54aum26tv62vd', '2021-10-20 05:29:28', '2021-10-20 05:29:28', 0, 1),
(161, 'um3q7qc7v7rkthjjdkis9tebsi', '2021-10-20 05:34:50', '2021-10-20 05:34:50', 0, 1),
(162, 'mkd8hijd7puivcb23mttisqo9v', '2021-11-05 04:37:39', '2021-11-05 04:37:41', 0, 1),
(163, 'baqmgqe58oscvjdh06q3u48b0c', '2021-11-17 23:20:24', '2021-11-17 23:20:28', 0, 1),
(164, 'uam96klr3i90pnaajoeo4kqlfa', '2021-11-18 00:54:54', '2021-11-18 00:54:55', 0, 1),
(165, 'hqji8nos7c3iklg0vjil2b21li', '2021-11-18 05:03:40', '2021-11-18 06:23:28', 0, 1),
(166, 'mm7ulq1gkiak3bdfaij25hnpb9', '2021-11-18 05:48:29', '2021-11-18 05:48:29', 0, 1),
(167, 'bsdi2jot5iattpp4h104phu8kv', '2021-11-18 17:06:14', '2021-11-18 20:15:04', 0, 1),
(168, 'nf0i94m9kcdjeoukmk4r90b0vl', '2021-11-18 17:23:34', '2021-11-18 17:23:34', 0, 1),
(169, 'v1f9hkchrgivl707r19fer0gqp', '2021-11-18 22:24:27', '2021-11-19 00:39:40', 0, 1),
(170, 'slhs775ofhglh074rb3lou0316', '2021-11-19 06:16:07', '2021-11-19 06:16:14', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_info`
--

CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Visitor ID',
  `http_referer` varchar(255) DEFAULT NULL COMMENT 'HTTP Referrer',
  `http_user_agent` varchar(255) DEFAULT NULL COMMENT 'HTTP User-Agent',
  `http_accept_charset` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Charset',
  `http_accept_language` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Language',
  `server_addr` varbinary(16) DEFAULT NULL,
  `remote_addr` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Info Table';

--
-- Dumping data for table `log_visitor_info`
--

INSERT INTO `log_visitor_info` (`visitor_id`, `http_referer`, `http_user_agent`, `http_accept_charset`, `http_accept_language`, `server_addr`, `remote_addr`) VALUES
(1, 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(2, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/admin/cms_page/index/key/9d38e271914eb6bba9d2323fdb00097f/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(3, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(4, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(5, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(6, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(7, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/admin/cms_page/index/key/f2f25d89700922589e5e8c299ed9e3dc/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(8, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(9, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(10, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(11, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(12, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(13, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(14, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(15, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(16, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(17, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(18, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(19, NULL, NULL, NULL, NULL, 0x7f000001, 0x7f000001),
(20, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/about-magento-demo-store/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(21, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(22, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(23, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(24, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(25, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(26, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(27, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(28, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(29, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(30, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(31, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(32, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/checkout/cart/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(33, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/checkout/cart/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(34, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(35, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(36, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', NULL, 'en-US,en;q=0.9', 0x7f000001, 0x7f000001),
(37, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(38, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(39, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(40, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(41, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(42, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(43, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(44, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(45, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(46, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(47, 'http://127.0.0.1/magento-mirror-magento-1.9/index.php/category/?___store=default', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(48, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(49, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(50, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(51, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(52, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(53, 'http://127.0.0.1/magento-mirror-magento-1.9/games', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(54, 'http://127.0.0.1/magento-mirror-magento-1.9/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(55, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(56, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(57, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(58, 'http://127.0.0.1/magento-mirror-magento-1.9/minecraft-windows-10.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(59, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(60, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(61, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(62, 'http://127.0.0.1/magento-mirror-magento-1.9/minecraft-windows-10.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(63, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(64, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(65, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(66, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(67, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(68, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(69, 'http://127.0.0.1/magento-mirror-magento-1.9/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(70, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(71, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(72, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(73, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(74, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(75, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(76, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(77, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(78, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(79, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', NULL, 'en-US,en;q=0.9', 0x7f000001, 0x7f000001),
(80, 'http://127.0.0.1/magento-mirror-magento-1.9/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(81, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(82, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(83, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(84, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(85, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(86, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(87, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(88, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(89, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(90, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(91, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(92, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(93, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(94, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(95, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(96, 'http://127.0.0.1/magento-mirror-magento-1.9/checkout/cart/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(97, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', NULL, 'en-US,en;q=0.9', 0x7f000001, 0x7f000001),
(98, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', NULL, 'en-US,en;q=0.9', 0x7f000001, 0x7f000001),
(99, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(100, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(101, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(102, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', NULL, 'en-US,en;q=0.9', 0x7f000001, 0x7f000001),
(103, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', NULL, 'en-US,en;q=0.9', 0x7f000001, 0x7f000001),
(104, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(105, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(106, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(107, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(108, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(109, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(110, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(111, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(112, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(113, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(114, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(115, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(116, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(117, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(118, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(119, 'http://127.0.0.1/magento-mirror-magento-1.9/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(120, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(121, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(122, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(123, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(124, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(125, 'http://127.0.0.1/magento-mirror-magento-1.9/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(126, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(127, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(128, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(129, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(130, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(131, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(132, 'http://127.0.0.1/magento-mirror-magento-1.9/fps.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(133, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(134, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(135, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(136, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(137, 'http://127.0.0.1/magento-mirror-magento-1.9/state-of-decay-2-juggernaut-edition', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(138, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(139, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(140, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(141, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(142, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(143, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(144, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(145, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(146, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(147, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(148, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(149, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(150, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(151, 'http://127.0.0.1/magento-mirror-magento-1.9/games', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(152, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(153, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(154, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(155, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(156, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(157, 'http://127.0.0.1/magento-mirror-magento-1.9/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(158, 'http://127.0.0.1/magento-mirror-magento-1.9/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(159, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(160, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(161, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(162, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(163, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(164, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(165, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(166, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(167, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(168, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(169, 'http://127.0.0.1/magento-mirror-magento-1.9/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001),
(170, 'http://127.0.0.1/magento-mirror-magento-1.9/games', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', NULL, 'en-US,en;q=0.5', 0x7f000001, 0x7f000001);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_online`
--

CREATE TABLE `log_visitor_online` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Visitor ID',
  `visitor_type` varchar(1) NOT NULL COMMENT 'Visitor Type',
  `remote_addr` varbinary(16) DEFAULT NULL,
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NULL DEFAULT NULL COMMENT 'Last Visit Time',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `last_url` varchar(255) DEFAULT NULL COMMENT 'Last URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Online Table';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_problem`
--

CREATE TABLE `newsletter_problem` (
  `problem_id` int(10) UNSIGNED NOT NULL COMMENT 'Problem Id',
  `subscriber_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Queue Id',
  `problem_error_code` int(10) UNSIGNED DEFAULT 0 COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue`
--

CREATE TABLE `newsletter_queue` (
  `queue_id` int(10) UNSIGNED NOT NULL COMMENT 'Queue Id',
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Template Id',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text DEFAULT NULL COMMENT 'Newsletter Text',
  `newsletter_styles` text DEFAULT NULL COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_link`
--

CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(10) UNSIGNED NOT NULL COMMENT 'Queue Link Id',
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Queue Id',
  `subscriber_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_store_link`
--

CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Queue Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(10) UNSIGNED NOT NULL COMMENT 'Subscriber Id',
  `store_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT 0 COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_template`
--

CREATE TABLE `newsletter_template` (
  `template_id` int(10) UNSIGNED NOT NULL COMMENT 'Template Id',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text DEFAULT NULL COMMENT 'Template Text',
  `template_text_preprocessed` text DEFAULT NULL COMMENT 'Template Text Preprocessed',
  `template_styles` text DEFAULT NULL COMMENT 'Template Styles',
  `template_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) UNSIGNED DEFAULT 1 COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';

--
-- Dumping data for table `newsletter_template`
--

INSERT INTO `newsletter_template` (`template_id`, `template_code`, `template_text`, `template_text_preprocessed`, `template_styles`, `template_type`, `template_subject`, `template_sender_name`, `template_sender_email`, `template_actual`, `added_at`, `modified_at`) VALUES
(1, 'Example Newsletter Template', '{{template config_path=\"design/email/header\"}}\n{{inlinecss file=\"email-inline.css\"}}\n\n<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n<tr>\n    <td class=\"full\">\n        <table class=\"columns\">\n            <tr>\n                <td class=\"email-heading\">\n                    <h1>Welcome</h1>\n                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n                    sed do eiusmod tempor incididunt ut labore et.</p>\n                </td>\n                <td class=\"store-info\">\n                    <h4>Contact Us</h4>\n                    <p>\n                        {{depend store_phone}}\n                        <b>Call Us:</b>\n                        <a href=\"tel:{{var phone}}\">{{var store_phone}}</a><br>\n                        {{/depend}}\n                        {{depend store_hours}}\n                        <span class=\"no-link\">{{var store_hours}}</span><br>\n                        {{/depend}}\n                        {{depend store_email}}\n                        <b>Email:</b> <a href=\"mailto:{{var store_email}}\">{{var store_email}}</a>\n                        {{/depend}}\n                    </p>\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>\n<tr>\n    <td class=\"full\">\n        <table class=\"columns\">\n            <tr>\n                <td>\n                    <img width=\"600\" src=\"http://placehold.it/600x200\" class=\"main-image\">\n                </td>\n                <td class=\"expander\"></td>\n            </tr>\n        </table>\n        <table class=\"columns\">\n            <tr>\n                <td class=\"panel\">\n                    <p>Phasellus dictum sapien a neque luctus cursus. Pellentesque sem dolor, fringilla et pharetra\n                    vitae. <a href=\"#\">Click it! &raquo;</a></p>\n                </td>\n                <td class=\"expander\"></td>\n            </tr>\n        </table>\n    </td>\n</tr>\n<tr>\n    <td>\n        <table class=\"row\">\n            <tr>\n                <td class=\"half left wrapper\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor\n                                incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n                                sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.</p>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor\n                                incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed\n                                do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.</p>\n                                <table class=\"button\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Click Me!</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n                <td class=\"half right wrapper last\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td class=\"panel sidebar-links\">\n                                <h6>Header Thing</h6>\n                                <p>Sub-head or something</p>\n                                <table>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr><td>&nbsp;</td></tr>\n                                </table>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                    <br>\n                    <table class=\"columns\">\n                        <tr>\n                            <td class=\"panel\">\n                                <h6>Connect With Us:</h6>\n                                <table class=\"social-button facebook\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Facebook</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <hr>\n                                <table class=\"social-button twitter\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Twitter</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <hr>\n                                <table class=\"social-button google-plus\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Google +</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <br>\n                                <h6>Contact Info:</h6>\n                                {{depend store_phone}}\n                                <p>\n                                    <b>Call Us:</b>\n                                    <a href=\"tel:{{var phone}}\">{{var store_phone}}</a>\n                                </p>\n                                {{/depend}}\n                                {{depend store_hours}}\n                                <p><span class=\"no-link\">{{var store_hours}}</span><br></p>\n                                {{/depend}}\n                                {{depend store_email}}\n                                <p><b>Email:</b> <a href=\"mailto:{{var store_email}}\">{{var store_email}}</a></p>\n                                {{/depend}}\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n            </tr>\n        </table>\n        <table class=\"row\">\n            <tr>\n                <td class=\"full wrapper\">\n                    {{block type=\"catalog/product_new\" template=\"email/catalog/product/new.phtml\" products_count=\"4\"\n                    column_count=\"4\" }}\n                </td>\n            </tr>\n        </table>\n        <table class=\"row\">\n            <tr>\n                <td class=\"full wrapper last\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td align=\"center\">\n                                <center>\n                                    <p><a href=\"#\">Terms</a> | <a href=\"#\">Privacy</a> | <a href=\"#\">Unsubscribe</a></p>\n                                </center>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>\n</table>\n\n{{template config_path=\"design/email/footer\"}}', NULL, NULL, 2, 'Example Subject', 'Owner', 'owner@example.com', 1, '2021-07-26 01:30:04', '2021-07-26 01:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE `oauth_consumer` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) UNSIGNED NOT NULL COMMENT 'Nonce Timestamp'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='oauth_nonce';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_token`
--

CREATE TABLE `oauth_token` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `consumer_id` int(10) UNSIGNED NOT NULL COMMENT 'Consumer ID',
  `admin_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Token revoked',
  `authorized` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Token authorized',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Token creation timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_cert`
--

CREATE TABLE `paypal_cert` (
  `cert_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Cert Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `content` text DEFAULT NULL COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_transaction`
--

CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob DEFAULT NULL COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report`
--

CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) UNSIGNED NOT NULL COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report_row`
--

CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) UNSIGNED NOT NULL COMMENT 'Row Id',
  `report_id` int(10) UNSIGNED NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT '' COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';

-- --------------------------------------------------------

--
-- Table structure for table `permission_block`
--

CREATE TABLE `permission_block` (
  `block_id` int(10) UNSIGNED NOT NULL COMMENT 'Block ID',
  `block_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Block Name',
  `is_allowed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Mark that block can be processed by filters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='System blocks that can be processed via content filter';

--
-- Dumping data for table `permission_block`
--

INSERT INTO `permission_block` (`block_id`, `block_name`, `is_allowed`) VALUES
(1, 'core/template', 1),
(2, 'catalog/product_new', 1),
(3, 'catalog/product_list', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_variable`
--

CREATE TABLE `permission_variable` (
  `variable_id` int(10) UNSIGNED NOT NULL COMMENT 'Variable ID',
  `variable_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Config Path',
  `is_allowed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Mark that config can be processed by filters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='System variables that can be processed via content filter';

--
-- Dumping data for table `permission_variable`
--

INSERT INTO `permission_variable` (`variable_id`, `variable_name`, `is_allowed`) VALUES
(1, 'trans_email/ident_support/name', 1),
(2, 'trans_email/ident_support/email', 1),
(3, 'web/unsecure/base_url', 1),
(4, 'web/secure/base_url', 1),
(5, 'trans_email/ident_general/name', 1),
(6, 'trans_email/ident_general/email', 1),
(7, 'trans_email/ident_sales/name', 1),
(8, 'trans_email/ident_sales/email', 1),
(9, 'trans_email/ident_custom1/name', 1),
(10, 'trans_email/ident_custom1/email', 1),
(11, 'trans_email/ident_custom2/name', 1),
(12, 'trans_email/ident_custom2/email', 1),
(13, 'general/store_information/name', 1),
(14, 'general/store_information/phone', 1),
(15, 'general/store_information/address', 1);

-- --------------------------------------------------------

--
-- Table structure for table `persistent_session`
--

CREATE TABLE `persistent_session` (
  `persistent_id` int(10) UNSIGNED NOT NULL COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `info` text DEFAULT NULL COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `poll_id` int(10) UNSIGNED NOT NULL COMMENT 'Poll Id',
  `poll_title` varchar(255) DEFAULT NULL COMMENT 'Poll title',
  `votes_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Votes Count',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store id',
  `date_posted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date posted',
  `date_closed` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  `active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is active',
  `closed` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is closed',
  `answers_display` smallint(6) DEFAULT NULL COMMENT 'Answers display'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll';

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`poll_id`, `poll_title`, `votes_count`, `store_id`, `date_posted`, `date_closed`, `active`, `closed`, `answers_display`) VALUES
(1, 'What is your favorite color', 9, 0, '2021-07-26 01:30:04', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poll_answer`
--

CREATE TABLE `poll_answer` (
  `answer_id` int(10) UNSIGNED NOT NULL COMMENT 'Answer Id',
  `poll_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Poll Id',
  `answer_title` varchar(255) DEFAULT NULL COMMENT 'Answer title',
  `votes_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Votes Count',
  `answer_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Answers display'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Answers';

--
-- Dumping data for table `poll_answer`
--

INSERT INTO `poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES
(1, 1, 'Green', 4, 0),
(2, 1, 'Red', 2, 0),
(3, 1, 'Black', 1, 0),
(4, 1, 'Magenta', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_store`
--

CREATE TABLE `poll_store` (
  `poll_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Poll Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Store';

--
-- Dumping data for table `poll_store`
--

INSERT INTO `poll_store` (`poll_id`, `store_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_vote`
--

CREATE TABLE `poll_vote` (
  `vote_id` int(10) UNSIGNED NOT NULL COMMENT 'Vote Id',
  `poll_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Poll Id',
  `poll_answer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Poll answer id',
  `ip_address` varbinary(16) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer id',
  `vote_time` timestamp NULL DEFAULT NULL COMMENT 'Date closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Vote';

--
-- Dumping data for table `poll_vote`
--

INSERT INTO `poll_vote` (`vote_id`, `poll_id`, `poll_answer_id`, `ip_address`, `customer_id`, `vote_time`) VALUES
(1, 1, 3, 0x7f000001, NULL, '2021-07-26 03:55:48'),
(2, 1, 2, 0x7f000001, 1, '2021-07-29 07:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_price`
--

CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Product alert price id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price amount',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product alert send count',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product alert status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_stock`
--

CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) UNSIGNED NOT NULL COMMENT 'Product alert stock id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Send Count',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product alert status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Rating Id',
  `entity_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Position On Frontend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ratings';

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES
(1, 1, 'Quality', 0),
(2, 1, 'Value', 0),
(3, 1, 'Price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating_entity`
--

CREATE TABLE `rating_entity` (
  `entity_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating entities';

--
-- Dumping data for table `rating_entity`
--

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `rating_option`
--

CREATE TABLE `rating_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Rating Option Id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Option Value',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Ration option position on frontend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating options';

--
-- Dumping data for table `rating_option`
--

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote`
--

CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Vote id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Vote option id',
  `remote_ip` varchar(50) DEFAULT NULL,
  `remote_ip_long` varbinary(16) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating id',
  `review_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Vote option value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote_aggregated`
--

CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating id',
  `entity_pk_value` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product id',
  `vote_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Vote dty',
  `vote_value_sum` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT 0 COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `rating_store`
--

CREATE TABLE `rating_store` (
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

-- --------------------------------------------------------

--
-- Table structure for table `rating_title`
--

CREATE TABLE `rating_title` (
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

-- --------------------------------------------------------

--
-- Table structure for table `report_compared_product_index`
--

CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Index Id',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

CREATE TABLE `report_event` (
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Logged At',
  `event_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event Type Id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Object Id',
  `subject_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Subject Id',
  `subtype` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Subtype',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';

--
-- Dumping data for table `report_event`
--

INSERT INTO `report_event` (`event_id`, `logged_at`, `event_type_id`, `object_id`, `subject_id`, `subtype`, `store_id`) VALUES
(1, '2021-07-29 19:43:15', 1, 1, 27, 1, 1),
(2, '2021-07-29 19:43:31', 1, 1, 27, 1, 1),
(3, '2021-07-29 19:47:45', 1, 1, 27, 1, 1),
(4, '2021-07-29 19:49:22', 1, 1, 27, 1, 1),
(5, '2021-07-29 19:49:24', 1, 1, 27, 1, 1),
(6, '2021-07-29 19:49:34', 1, 1, 27, 1, 1),
(7, '2021-07-29 19:53:56', 4, 1, 27, 1, 1),
(8, '2021-07-29 19:59:57', 1, 1, 27, 1, 1),
(9, '2021-07-29 20:09:51', 1, 1, 27, 1, 1),
(10, '2021-07-29 20:09:55', 1, 1, 29, 1, 1),
(11, '2021-07-29 20:11:05', 1, 1, 27, 1, 1),
(12, '2021-07-29 20:11:37', 1, 1, 27, 1, 1),
(13, '2021-07-29 20:11:54', 1, 1, 27, 1, 1),
(14, '2021-07-29 21:36:53', 1, 1, 31, 1, 1),
(15, '2021-07-29 22:15:07', 1, 1, 31, 1, 1),
(16, '2021-07-29 22:15:37', 1, 1, 31, 1, 1),
(17, '2021-07-29 22:18:31', 1, 1, 31, 1, 1),
(18, '2021-07-29 22:29:02', 1, 1, 31, 1, 1),
(19, '2021-07-29 22:33:53', 1, 1, 31, 1, 1),
(20, '2021-07-29 22:35:04', 1, 1, 2, 0, 1),
(21, '2021-07-29 22:35:08', 5, 1, 2, 0, 1),
(22, '2021-07-29 22:35:26', 1, 1, 2, 0, 1),
(23, '2021-07-29 22:35:28', 4, 1, 2, 0, 1),
(24, '2021-07-30 05:24:02', 1, 1, 33, 1, 1),
(25, '2021-07-30 05:46:49', 1, 1, 2, 0, 1),
(26, '2021-07-30 05:56:39', 1, 1, 2, 0, 1),
(27, '2021-07-30 06:04:28', 1, 1, 2, 0, 1),
(28, '2021-07-30 06:04:41', 1, 1, 33, 1, 1),
(29, '2021-07-30 06:04:59', 1, 1, 33, 1, 1),
(30, '2021-07-30 06:08:21', 1, 1, 33, 1, 1),
(31, '2021-07-30 06:08:30', 1, 1, 33, 1, 1),
(32, '2021-07-31 06:45:29', 1, 2, 37, 1, 1),
(33, '2021-07-31 06:45:34', 1, 1, 37, 1, 1),
(34, '2021-07-31 06:47:42', 1, 1, 37, 1, 1),
(35, '2021-07-31 06:47:48', 1, 1, 37, 1, 1),
(36, '2021-08-01 05:34:59', 1, 1, 38, 1, 1),
(37, '2021-08-01 19:28:45', 1, 1, 39, 1, 1),
(38, '2021-08-01 19:29:32', 1, 1, 41, 1, 1),
(39, '2021-08-01 19:31:40', 1, 1, 39, 1, 1),
(40, '2021-08-01 19:31:52', 1, 1, 39, 1, 1),
(41, '2021-08-01 19:36:03', 1, 1, 39, 1, 1),
(42, '2021-08-01 19:36:04', 1, 1, 39, 1, 1),
(43, '2021-08-01 19:41:45', 1, 1, 39, 1, 1),
(44, '2021-08-01 19:48:28', 1, 3, 39, 1, 1),
(45, '2021-08-01 19:52:26', 1, 4, 39, 1, 1),
(46, '2021-08-01 20:09:41', 1, 1, 39, 1, 1),
(47, '2021-08-01 20:10:31', 1, 1, 39, 1, 1),
(48, '2021-08-01 20:10:41', 1, 1, 39, 1, 1),
(49, '2021-08-01 20:11:43', 1, 1, 39, 1, 1),
(50, '2021-08-01 20:38:33', 1, 3, 39, 1, 1),
(51, '2021-08-01 20:46:20', 1, 4, 39, 1, 1),
(52, '2021-08-01 20:46:38', 1, 1, 39, 1, 1),
(53, '2021-08-01 20:46:45', 4, 1, 39, 1, 1),
(54, '2021-08-01 20:46:55', 1, 1, 39, 1, 1),
(55, '2021-08-01 21:15:31', 1, 1, 39, 1, 1),
(56, '2021-08-01 22:15:30', 1, 5, 39, 1, 1),
(57, '2021-08-01 22:15:37', 4, 5, 39, 1, 1),
(58, '2021-08-02 00:06:47', 1, 1, 46, 1, 1),
(59, '2021-08-02 00:12:36', 1, 1, 46, 1, 1),
(60, '2021-08-02 00:17:37', 1, 4, 46, 1, 1),
(61, '2021-08-02 01:42:11', 1, 4, 46, 1, 1),
(62, '2021-08-02 02:08:46', 1, 5, 47, 1, 1),
(63, '2021-08-02 02:34:44', 1, 5, 47, 1, 1),
(64, '2021-08-02 02:34:48', 1, 4, 47, 1, 1),
(65, '2021-08-02 02:35:34', 1, 4, 47, 1, 1),
(66, '2021-08-02 02:48:18', 1, 1, 47, 1, 1),
(67, '2021-08-02 02:53:16', 1, 2, 47, 1, 1),
(68, '2021-08-02 03:17:51', 4, 4, 47, 1, 1),
(69, '2021-08-02 03:28:36', 1, 5, 47, 1, 1),
(70, '2021-08-12 23:53:50', 1, 5, 52, 1, 1),
(71, '2021-08-13 01:29:57', 1, 1, 53, 1, 1),
(72, '2021-08-13 01:30:02', 1, 1, 53, 1, 1),
(73, '2021-08-13 01:30:25', 1, 1, 53, 1, 1),
(74, '2021-08-13 01:32:54', 1, 1, 53, 1, 1),
(75, '2021-08-13 01:32:57', 1, 1, 53, 1, 1),
(76, '2021-08-13 01:43:19', 1, 1, 53, 1, 1),
(77, '2021-08-13 01:46:21', 1, 1, 53, 1, 1),
(78, '2021-08-13 01:46:23', 1, 1, 53, 1, 1),
(79, '2021-08-13 01:46:37', 1, 1, 53, 1, 1),
(80, '2021-08-13 01:46:53', 1, 1, 53, 1, 1),
(81, '2021-08-13 01:47:26', 1, 1, 53, 1, 1),
(82, '2021-08-13 01:47:39', 1, 1, 53, 1, 1),
(83, '2021-08-13 01:47:42', 1, 1, 53, 1, 1),
(84, '2021-08-13 01:51:02', 1, 1, 53, 1, 1),
(85, '2021-08-13 01:53:11', 1, 1, 53, 1, 1),
(86, '2021-08-13 01:53:14', 1, 1, 53, 1, 1),
(87, '2021-08-13 01:53:30', 1, 1, 53, 1, 1),
(88, '2021-08-13 01:53:54', 1, 1, 53, 1, 1),
(89, '2021-08-13 01:54:28', 1, 1, 53, 1, 1),
(90, '2021-08-13 03:57:09', 1, 1, 54, 1, 1),
(91, '2021-08-13 04:00:49', 1, 1, 54, 1, 1),
(92, '2021-08-13 04:04:08', 1, 1, 54, 1, 1),
(93, '2021-08-13 04:04:09', 1, 1, 54, 1, 1),
(94, '2021-08-13 04:04:21', 1, 1, 54, 1, 1),
(95, '2021-08-13 04:05:25', 1, 1, 54, 1, 1),
(96, '2021-08-13 04:05:43', 1, 1, 54, 1, 1),
(97, '2021-08-13 04:05:56', 1, 1, 54, 1, 1),
(98, '2021-08-13 04:05:58', 1, 1, 54, 1, 1),
(99, '2021-08-13 04:06:52', 1, 1, 54, 1, 1),
(100, '2021-08-13 04:07:15', 1, 1, 54, 1, 1),
(101, '2021-08-13 04:08:05', 1, 1, 54, 1, 1),
(102, '2021-08-13 04:08:23', 1, 1, 54, 1, 1),
(103, '2021-08-13 04:08:49', 1, 1, 54, 1, 1),
(104, '2021-08-13 04:08:57', 1, 1, 54, 1, 1),
(105, '2021-08-13 04:09:13', 1, 1, 54, 1, 1),
(106, '2021-08-13 04:09:14', 1, 1, 54, 1, 1),
(107, '2021-08-13 04:09:25', 1, 1, 54, 1, 1),
(108, '2021-08-13 04:10:05', 1, 1, 54, 1, 1),
(109, '2021-08-13 04:10:11', 1, 1, 54, 1, 1),
(110, '2021-08-13 04:10:26', 1, 1, 54, 1, 1),
(111, '2021-08-13 04:10:27', 1, 1, 54, 1, 1),
(112, '2021-08-13 04:10:28', 1, 1, 54, 1, 1),
(113, '2021-08-13 04:11:37', 1, 2, 54, 1, 1),
(114, '2021-08-13 04:12:05', 1, 5, 54, 1, 1),
(115, '2021-08-13 04:12:18', 1, 4, 54, 1, 1),
(116, '2021-08-13 04:12:23', 1, 3, 54, 1, 1),
(117, '2021-08-13 04:12:33', 1, 1, 54, 1, 1),
(118, '2021-08-13 04:14:41', 1, 1, 54, 1, 1),
(119, '2021-08-13 04:14:42', 1, 1, 54, 1, 1),
(120, '2021-08-13 04:14:43', 1, 1, 54, 1, 1),
(121, '2021-08-13 04:14:51', 1, 1, 54, 1, 1),
(122, '2021-08-13 04:15:40', 1, 1, 54, 1, 1),
(123, '2021-08-13 04:16:49', 1, 1, 54, 1, 1),
(124, '2021-08-13 04:16:51', 1, 1, 54, 1, 1),
(125, '2021-08-13 04:17:02', 1, 1, 54, 1, 1),
(126, '2021-08-13 04:19:55', 1, 1, 54, 1, 1),
(127, '2021-08-13 04:20:01', 1, 1, 54, 1, 1),
(128, '2021-08-13 04:32:53', 1, 1, 54, 1, 1),
(129, '2021-08-13 04:33:01', 1, 1, 54, 1, 1),
(130, '2021-08-13 04:34:21', 1, 1, 54, 1, 1),
(131, '2021-08-13 04:35:25', 1, 1, 54, 1, 1),
(132, '2021-08-13 04:35:53', 1, 1, 54, 1, 1),
(133, '2021-08-13 04:35:59', 1, 1, 54, 1, 1),
(134, '2021-08-13 04:36:40', 1, 1, 54, 1, 1),
(135, '2021-08-13 04:36:56', 1, 1, 54, 1, 1),
(136, '2021-08-13 04:36:58', 1, 1, 54, 1, 1),
(137, '2021-08-13 04:37:06', 1, 1, 54, 1, 1),
(138, '2021-08-13 04:37:07', 1, 1, 54, 1, 1),
(139, '2021-08-13 04:42:29', 1, 1, 54, 1, 1),
(140, '2021-08-13 04:42:47', 1, 1, 54, 1, 1),
(141, '2021-08-13 04:42:54', 1, 1, 54, 1, 1),
(142, '2021-08-13 04:43:11', 1, 1, 54, 1, 1),
(143, '2021-08-13 04:43:34', 1, 1, 54, 1, 1),
(144, '2021-08-13 04:44:06', 1, 1, 54, 1, 1),
(145, '2021-08-13 04:44:13', 1, 1, 54, 1, 1),
(146, '2021-08-13 04:45:09', 1, 1, 54, 1, 1),
(147, '2021-08-13 04:45:59', 1, 1, 54, 1, 1),
(148, '2021-08-13 04:46:04', 1, 1, 54, 1, 1),
(149, '2021-08-13 04:47:45', 1, 1, 54, 1, 1),
(150, '2021-08-13 04:48:10', 1, 1, 54, 1, 1),
(151, '2021-08-13 04:48:30', 1, 1, 54, 1, 1),
(152, '2021-08-13 04:49:02', 1, 1, 54, 1, 1),
(153, '2021-08-13 04:49:41', 1, 5, 54, 1, 1),
(154, '2021-08-13 04:49:53', 1, 1, 54, 1, 1),
(155, '2021-08-13 04:50:51', 1, 1, 54, 1, 1),
(156, '2021-08-13 04:51:13', 1, 1, 54, 1, 1),
(157, '2021-08-13 04:52:16', 1, 1, 54, 1, 1),
(158, '2021-08-13 04:52:31', 1, 1, 54, 1, 1),
(159, '2021-08-13 04:52:37', 1, 1, 54, 1, 1),
(160, '2021-08-15 23:38:25', 1, 1, 55, 1, 1),
(161, '2021-08-15 23:41:27', 1, 1, 55, 1, 1),
(162, '2021-08-15 23:42:46', 1, 1, 55, 1, 1),
(163, '2021-08-15 23:44:38', 1, 1, 55, 1, 1),
(164, '2021-08-15 23:45:55', 1, 1, 55, 1, 1),
(165, '2021-08-15 23:46:09', 1, 1, 55, 1, 1),
(166, '2021-08-15 23:46:44', 1, 1, 55, 1, 1),
(167, '2021-08-15 23:47:27', 1, 1, 55, 1, 1),
(168, '2021-08-15 23:47:58', 1, 1, 55, 1, 1),
(169, '2021-08-15 23:49:09', 1, 1, 55, 1, 1),
(170, '2021-08-15 23:49:10', 1, 1, 55, 1, 1),
(171, '2021-08-15 23:49:29', 1, 1, 55, 1, 1),
(172, '2021-08-15 23:49:34', 1, 1, 55, 1, 1),
(173, '2021-08-16 00:02:14', 1, 1, 55, 1, 1),
(174, '2021-08-16 00:04:13', 1, 1, 55, 1, 1),
(175, '2021-08-16 00:04:16', 1, 1, 55, 1, 1),
(176, '2021-08-16 00:29:33', 1, 6, 55, 1, 1),
(177, '2021-08-16 00:30:02', 1, 6, 55, 1, 1),
(178, '2021-08-16 00:30:32', 1, 6, 55, 1, 1),
(179, '2021-08-16 00:30:33', 1, 6, 55, 1, 1),
(180, '2021-08-16 00:30:34', 1, 6, 55, 1, 1),
(181, '2021-08-16 00:31:03', 1, 6, 55, 1, 1),
(182, '2021-08-16 00:31:45', 1, 6, 55, 1, 1),
(183, '2021-08-16 00:31:56', 1, 6, 55, 1, 1),
(184, '2021-08-16 00:34:36', 1, 6, 55, 1, 1),
(185, '2021-08-16 00:34:39', 1, 6, 55, 1, 1),
(186, '2021-08-16 00:35:46', 1, 6, 55, 1, 1),
(187, '2021-08-16 00:35:48', 1, 6, 55, 1, 1),
(188, '2021-08-16 00:35:51', 1, 6, 55, 1, 1),
(189, '2021-08-16 00:36:31', 1, 6, 55, 1, 1),
(190, '2021-08-16 00:36:41', 1, 6, 55, 1, 1),
(191, '2021-08-16 00:36:43', 1, 6, 55, 1, 1),
(192, '2021-08-16 00:36:47', 1, 6, 55, 1, 1),
(193, '2021-08-16 00:36:51', 1, 6, 55, 1, 1),
(194, '2021-08-16 00:36:53', 1, 6, 55, 1, 1),
(195, '2021-08-16 00:36:54', 1, 6, 55, 1, 1),
(196, '2021-08-16 00:39:55', 1, 6, 55, 1, 1),
(197, '2021-08-16 00:39:57', 1, 6, 55, 1, 1),
(198, '2021-08-16 00:40:06', 1, 6, 55, 1, 1),
(199, '2021-08-16 00:41:02', 1, 6, 55, 1, 1),
(200, '2021-08-16 00:41:12', 1, 6, 55, 1, 1),
(201, '2021-08-16 00:44:10', 1, 6, 55, 1, 1),
(202, '2021-08-16 00:44:12', 1, 6, 55, 1, 1),
(203, '2021-08-16 00:44:36', 1, 6, 55, 1, 1),
(204, '2021-08-16 00:44:43', 1, 6, 55, 1, 1),
(205, '2021-08-16 00:44:44', 1, 6, 55, 1, 1),
(206, '2021-08-16 00:44:45', 1, 6, 55, 1, 1),
(207, '2021-08-16 00:45:18', 1, 6, 55, 1, 1),
(208, '2021-08-16 00:45:18', 1, 6, 55, 1, 1),
(209, '2021-08-16 00:45:29', 1, 6, 55, 1, 1),
(210, '2021-08-16 00:45:30', 1, 6, 55, 1, 1),
(211, '2021-08-16 00:45:50', 1, 6, 55, 1, 1),
(212, '2021-08-16 00:45:54', 1, 6, 55, 1, 1),
(213, '2021-08-16 00:46:08', 1, 6, 55, 1, 1),
(214, '2021-08-16 00:46:09', 1, 6, 55, 1, 1),
(215, '2021-08-16 00:46:12', 1, 6, 55, 1, 1),
(216, '2021-08-16 00:46:33', 1, 6, 55, 1, 1),
(217, '2021-08-16 00:46:34', 1, 6, 55, 1, 1),
(218, '2021-08-16 00:46:35', 1, 6, 55, 1, 1),
(219, '2021-08-16 00:46:42', 1, 6, 55, 1, 1),
(220, '2021-08-16 00:46:43', 1, 6, 55, 1, 1),
(221, '2021-08-16 00:46:44', 1, 6, 55, 1, 1),
(222, '2021-08-16 00:48:34', 1, 6, 55, 1, 1),
(223, '2021-08-16 00:48:50', 1, 6, 55, 1, 1),
(224, '2021-08-16 00:49:01', 1, 6, 55, 1, 1),
(225, '2021-08-16 00:49:02', 1, 6, 55, 1, 1),
(226, '2021-08-16 00:49:38', 1, 6, 55, 1, 1),
(227, '2021-08-16 00:49:42', 1, 6, 55, 1, 1),
(228, '2021-08-16 00:49:43', 1, 6, 55, 1, 1),
(229, '2021-08-16 00:51:00', 1, 6, 55, 1, 1),
(230, '2021-08-16 00:51:16', 1, 6, 55, 1, 1),
(231, '2021-08-16 00:51:17', 1, 6, 55, 1, 1),
(232, '2021-08-16 00:54:20', 1, 6, 55, 1, 1),
(233, '2021-08-16 00:54:22', 1, 6, 55, 1, 1),
(234, '2021-08-16 00:54:46', 1, 6, 55, 1, 1),
(235, '2021-08-16 00:54:48', 1, 6, 55, 1, 1),
(236, '2021-08-16 00:56:57', 1, 6, 55, 1, 1),
(237, '2021-08-16 00:58:49', 1, 6, 55, 1, 1),
(238, '2021-08-16 00:58:50', 1, 6, 55, 1, 1),
(239, '2021-08-16 00:59:20', 1, 6, 55, 1, 1),
(240, '2021-08-16 00:59:21', 1, 6, 55, 1, 1),
(241, '2021-08-16 00:59:40', 1, 6, 55, 1, 1),
(242, '2021-08-16 00:59:42', 1, 6, 55, 1, 1),
(243, '2021-08-16 00:59:50', 1, 6, 55, 1, 1),
(244, '2021-08-16 00:59:51', 1, 6, 55, 1, 1),
(245, '2021-08-16 00:59:56', 1, 6, 55, 1, 1),
(246, '2021-08-16 01:00:40', 1, 6, 55, 1, 1),
(247, '2021-08-16 01:00:42', 1, 6, 55, 1, 1),
(248, '2021-08-16 01:00:43', 1, 6, 55, 1, 1),
(249, '2021-08-16 01:01:54', 1, 6, 55, 1, 1),
(250, '2021-08-16 01:01:54', 1, 6, 55, 1, 1),
(251, '2021-08-16 01:02:20', 1, 6, 55, 1, 1),
(252, '2021-08-16 01:02:37', 1, 6, 55, 1, 1),
(253, '2021-08-16 01:04:53', 1, 6, 55, 1, 1),
(254, '2021-08-16 01:13:27', 1, 6, 55, 1, 1),
(255, '2021-08-16 01:16:18', 1, 6, 55, 1, 1),
(256, '2021-08-16 01:17:17', 1, 6, 55, 1, 1),
(257, '2021-08-16 01:23:13', 1, 6, 55, 1, 1),
(258, '2021-08-16 01:23:13', 1, 6, 55, 1, 1),
(259, '2021-08-16 01:23:50', 1, 6, 55, 1, 1),
(260, '2021-08-16 01:23:58', 1, 6, 55, 1, 1),
(261, '2021-08-16 01:24:03', 1, 6, 55, 1, 1),
(262, '2021-08-16 01:24:46', 1, 6, 55, 1, 1),
(263, '2021-08-16 01:24:47', 1, 6, 55, 1, 1),
(264, '2021-08-16 01:24:48', 1, 6, 55, 1, 1),
(265, '2021-08-16 01:25:34', 1, 6, 55, 1, 1),
(266, '2021-08-16 01:25:49', 1, 6, 55, 1, 1),
(267, '2021-08-16 01:25:50', 1, 6, 55, 1, 1),
(268, '2021-08-16 01:25:55', 1, 6, 55, 1, 1),
(269, '2021-08-16 01:26:02', 1, 6, 55, 1, 1),
(270, '2021-08-16 01:26:14', 1, 6, 55, 1, 1),
(271, '2021-08-16 03:20:16', 1, 6, 58, 1, 1),
(272, '2021-08-16 03:21:52', 1, 6, 58, 1, 1),
(273, '2021-08-16 03:21:55', 1, 6, 58, 1, 1),
(274, '2021-08-16 03:23:00', 1, 6, 58, 1, 1),
(275, '2021-08-16 03:23:20', 1, 6, 58, 1, 1),
(276, '2021-08-16 03:27:36', 1, 6, 58, 1, 1),
(277, '2021-08-16 03:29:36', 1, 6, 58, 1, 1),
(278, '2021-08-16 03:29:46', 1, 6, 58, 1, 1),
(279, '2021-08-16 03:29:58', 4, 6, 58, 1, 1),
(280, '2021-08-16 03:30:11', 1, 6, 58, 1, 1),
(281, '2021-08-16 03:30:17', 1, 6, 58, 1, 1),
(282, '2021-08-16 03:31:09', 4, 6, 2, 0, 1),
(283, '2021-08-16 04:02:03', 1, 6, 2, 0, 1),
(284, '2021-08-16 04:02:08', 1, 6, 2, 0, 1),
(285, '2021-08-16 04:02:09', 1, 6, 2, 0, 1),
(286, '2021-08-16 04:03:45', 1, 6, 2, 0, 1),
(287, '2021-08-16 04:04:17', 1, 6, 2, 0, 1),
(288, '2021-08-16 04:04:42', 1, 6, 2, 0, 1),
(289, '2021-08-16 04:04:59', 1, 6, 2, 0, 1),
(290, '2021-08-16 04:05:16', 1, 6, 2, 0, 1),
(291, '2021-08-16 04:05:27', 1, 6, 2, 0, 1),
(292, '2021-08-16 04:05:40', 1, 6, 2, 0, 1),
(293, '2021-08-16 04:05:48', 1, 6, 2, 0, 1),
(294, '2021-08-16 04:05:52', 1, 6, 2, 0, 1),
(295, '2021-08-16 04:06:25', 1, 6, 2, 0, 1),
(296, '2021-08-16 04:07:16', 1, 6, 2, 0, 1),
(297, '2021-08-16 04:08:39', 1, 6, 2, 0, 1),
(298, '2021-08-16 04:08:41', 1, 6, 2, 0, 1),
(299, '2021-08-16 04:09:34', 1, 6, 2, 0, 1),
(300, '2021-08-16 04:09:58', 1, 6, 2, 0, 1),
(301, '2021-08-16 04:10:23', 1, 6, 2, 0, 1),
(302, '2021-08-16 04:23:13', 1, 6, 2, 0, 1),
(303, '2021-08-16 04:24:50', 1, 6, 2, 0, 1),
(304, '2021-08-16 04:25:34', 1, 6, 2, 0, 1),
(305, '2021-08-16 04:25:52', 1, 6, 2, 0, 1),
(306, '2021-08-16 04:25:56', 1, 6, 2, 0, 1),
(307, '2021-08-16 04:26:09', 4, 6, 2, 0, 1),
(308, '2021-08-16 04:29:27', 1, 6, 2, 0, 1),
(309, '2021-08-16 04:29:48', 1, 6, 2, 0, 1),
(310, '2021-08-16 04:31:39', 1, 6, 2, 0, 1),
(311, '2021-08-16 04:32:05', 1, 6, 2, 0, 1),
(312, '2021-08-16 04:34:22', 1, 6, 2, 0, 1),
(313, '2021-09-08 21:42:52', 1, 6, 59, 1, 1),
(314, '2021-09-08 21:43:09', 1, 6, 60, 1, 1),
(315, '2021-09-08 21:48:11', 1, 6, 59, 1, 1),
(316, '2021-09-08 21:49:31', 1, 6, 59, 1, 1),
(317, '2021-09-08 22:37:04', 1, 6, 59, 1, 1),
(318, '2021-09-08 22:43:31', 1, 6, 59, 1, 1),
(319, '2021-09-08 22:47:25', 1, 6, 59, 1, 1),
(320, '2021-09-08 22:51:23', 1, 6, 2, 0, 1),
(321, '2021-09-08 22:52:56', 1, 6, 2, 0, 1),
(322, '2021-09-08 23:07:26', 1, 6, 2, 0, 1),
(323, '2021-09-08 23:36:13', 1, 6, 2, 0, 1),
(324, '2021-09-08 23:36:26', 1, 6, 2, 0, 1),
(325, '2021-09-08 23:36:33', 1, 6, 61, 1, 1),
(326, '2021-09-08 23:40:28', 1, 6, 2, 0, 1),
(327, '2021-09-08 23:51:40', 1, 6, 59, 1, 1),
(328, '2021-09-08 23:53:27', 1, 6, 59, 1, 1),
(329, '2021-09-08 23:55:36', 1, 6, 59, 1, 1),
(330, '2021-09-09 00:11:17', 1, 6, 59, 1, 1),
(331, '2021-09-09 03:49:27', 1, 6, 62, 1, 1),
(332, '2021-09-09 03:49:27', 1, 6, 62, 1, 1),
(333, '2021-09-09 03:50:12', 1, 6, 62, 1, 1),
(334, '2021-09-09 03:53:25', 1, 6, 62, 1, 1),
(335, '2021-09-09 03:54:13', 1, 6, 62, 1, 1),
(336, '2021-09-09 03:58:53', 1, 6, 62, 1, 1),
(337, '2021-09-09 03:58:56', 1, 6, 62, 1, 1),
(338, '2021-09-09 04:03:08', 1, 6, 62, 1, 1),
(339, '2021-09-09 04:14:07', 1, 7, 62, 1, 1),
(340, '2021-09-09 04:14:14', 1, 7, 62, 1, 1),
(341, '2021-09-09 04:14:54', 1, 7, 62, 1, 1),
(342, '2021-09-09 04:14:56', 1, 7, 62, 1, 1),
(343, '2021-09-09 04:16:05', 1, 7, 62, 1, 1),
(344, '2021-09-09 04:20:03', 1, 7, 62, 1, 1),
(345, '2021-09-09 04:20:24', 4, 7, 62, 1, 1),
(346, '2021-09-09 04:20:45', 4, 7, 2, 0, 1),
(347, '2021-09-09 04:21:30', 1, 7, 2, 0, 1),
(348, '2021-09-09 04:39:22', 1, 7, 2, 0, 1),
(349, '2021-09-09 04:41:10', 1, 7, 2, 0, 1),
(350, '2021-09-09 04:41:14', 1, 6, 2, 0, 1),
(351, '2021-09-09 04:47:29', 1, 8, 2, 0, 1),
(352, '2021-09-09 05:41:48', 1, 7, 2, 0, 1),
(353, '2021-09-09 05:55:03', 1, 7, 2, 0, 1),
(354, '2021-09-09 05:56:09', 1, 7, 2, 0, 1),
(355, '2021-09-09 05:56:18', 1, 7, 2, 0, 1),
(356, '2021-09-09 05:56:26', 1, 7, 2, 0, 1),
(357, '2021-09-09 06:12:27', 1, 7, 2, 0, 1),
(358, '2021-09-09 18:42:06', 1, 7, 65, 1, 1),
(359, '2021-09-09 19:25:24', 1, 9, 65, 1, 1),
(360, '2021-09-09 19:30:24', 1, 10, 65, 1, 1),
(361, '2021-09-09 19:30:35', 1, 9, 65, 1, 1),
(362, '2021-09-09 19:30:38', 1, 7, 65, 1, 1),
(363, '2021-09-09 19:34:36', 1, 11, 65, 1, 1),
(364, '2021-09-09 19:37:54', 1, 11, 65, 1, 1),
(365, '2021-09-09 19:42:53', 1, 12, 65, 1, 1),
(366, '2021-09-09 20:21:54', 1, 8, 65, 1, 1),
(367, '2021-09-09 21:36:41', 1, 11, 69, 1, 1),
(368, '2021-09-09 21:36:53', 1, 7, 69, 1, 1),
(369, '2021-09-09 21:42:37', 1, 13, 69, 1, 1),
(370, '2021-09-09 21:44:38', 1, 13, 69, 1, 1),
(371, '2021-09-09 21:44:43', 4, 13, 69, 1, 1),
(372, '2021-09-09 21:45:54', 1, 13, 69, 1, 1),
(373, '2021-09-09 21:45:56', 1, 13, 69, 1, 1),
(374, '2021-09-09 21:46:18', 1, 13, 69, 1, 1),
(375, '2021-09-09 21:49:31', 1, 13, 69, 1, 1),
(376, '2021-09-09 21:51:48', 1, 13, 69, 1, 1),
(377, '2021-09-09 21:57:46', 1, 13, 69, 1, 1),
(378, '2021-09-09 21:57:49', 1, 13, 69, 1, 1),
(379, '2021-09-09 21:58:36', 1, 13, 69, 1, 1),
(380, '2021-09-09 22:03:06', 1, 14, 69, 1, 1),
(381, '2021-09-09 22:03:13', 1, 14, 70, 1, 1),
(382, '2021-09-09 22:06:55', 1, 15, 69, 1, 1),
(383, '2021-09-09 22:09:53', 1, 13, 69, 1, 1),
(384, '2021-09-09 22:18:42', 1, 9, 69, 1, 1),
(385, '2021-09-09 22:23:16', 1, 13, 69, 1, 1),
(386, '2021-09-09 22:55:02', 1, 13, 69, 1, 1),
(387, '2021-09-09 22:55:13', 1, 13, 69, 1, 1),
(388, '2021-09-09 22:55:29', 4, 7, 69, 1, 1),
(389, '2021-09-09 22:55:36', 4, 9, 69, 1, 1),
(390, '2021-09-09 22:55:43', 1, 13, 69, 1, 1),
(391, '2021-09-09 22:55:55', 4, 11, 69, 1, 1),
(392, '2021-09-09 22:56:09', 1, 13, 69, 1, 1),
(393, '2021-09-09 22:56:09', 1, 8, 69, 1, 1),
(394, '2021-09-09 22:56:49', 1, 13, 69, 1, 1),
(395, '2021-09-09 22:56:51', 1, 13, 69, 1, 1),
(396, '2021-09-09 22:57:03', 1, 13, 69, 1, 1),
(397, '2021-09-09 22:57:12', 4, 13, 69, 1, 1),
(398, '2021-09-09 22:57:22', 1, 13, 69, 1, 1),
(399, '2021-09-09 22:58:09', 1, 14, 69, 1, 1),
(400, '2021-09-09 22:58:15', 1, 14, 69, 1, 1),
(401, '2021-09-09 22:58:23', 1, 14, 69, 1, 1),
(402, '2021-09-09 22:58:29', 1, 11, 69, 1, 1),
(403, '2021-09-09 22:58:36', 1, 11, 69, 1, 1),
(404, '2021-09-09 22:58:40', 4, 11, 69, 1, 1),
(405, '2021-09-09 22:59:46', 1, 14, 69, 1, 1),
(406, '2021-09-09 22:59:54', 1, 14, 69, 1, 1),
(407, '2021-09-09 23:01:21', 1, 14, 69, 1, 1),
(408, '2021-09-09 23:01:24', 1, 14, 69, 1, 1),
(409, '2021-09-09 23:02:34', 4, 14, 69, 1, 1),
(410, '2021-09-09 23:02:40', 1, 13, 69, 1, 1),
(411, '2021-09-09 23:02:44', 1, 13, 69, 1, 1),
(412, '2021-09-09 23:02:44', 1, 13, 69, 1, 1),
(413, '2021-09-09 23:02:54', 1, 10, 69, 1, 1),
(414, '2021-09-09 23:03:01', 1, 8, 69, 1, 1),
(415, '2021-09-09 23:10:14', 1, 9, 69, 1, 1),
(416, '2021-09-09 23:10:19', 1, 9, 72, 1, 1),
(417, '2021-09-09 23:10:43', 1, 9, 69, 1, 1),
(418, '2021-09-09 23:10:49', 1, 14, 69, 1, 1),
(419, '2021-09-09 23:11:15', 1, 14, 69, 1, 1),
(420, '2021-09-09 23:11:37', 1, 14, 69, 1, 1),
(421, '2021-09-09 23:12:48', 1, 10, 69, 1, 1),
(422, '2021-09-09 23:12:51', 1, 12, 69, 1, 1),
(423, '2021-09-09 23:12:55', 1, 12, 74, 1, 1),
(424, '2021-09-09 23:13:07', 1, 8, 69, 1, 1),
(425, '2021-09-09 23:21:17', 1, 13, 69, 1, 1),
(426, '2021-09-09 23:21:46', 1, 10, 69, 1, 1),
(427, '2021-09-09 23:21:50', 1, 12, 69, 1, 1),
(428, '2021-09-09 23:21:53', 1, 13, 69, 1, 1),
(429, '2021-09-09 23:21:56', 1, 15, 69, 1, 1),
(430, '2021-09-09 23:21:59', 1, 15, 77, 1, 1),
(431, '2021-09-09 23:27:56', 1, 7, 69, 1, 1),
(432, '2021-09-09 23:35:02', 1, 7, 69, 1, 1),
(433, '2021-09-09 23:35:53', 1, 8, 69, 1, 1),
(434, '2021-09-10 00:18:30', 1, 13, 79, 1, 1),
(435, '2021-09-10 00:19:03', 1, 7, 69, 1, 1),
(436, '2021-09-10 03:58:26', 1, 10, 80, 1, 1),
(437, '2021-09-10 03:59:16', 1, 7, 80, 1, 1),
(438, '2021-09-10 03:59:59', 1, 7, 83, 1, 1),
(439, '2021-09-10 04:01:43', 1, 7, 80, 1, 1),
(440, '2021-09-10 04:02:12', 1, 7, 80, 1, 1),
(441, '2021-09-10 04:04:47', 1, 7, 80, 1, 1),
(442, '2021-09-10 04:06:25', 1, 7, 80, 1, 1),
(443, '2021-09-10 04:06:27', 1, 7, 80, 1, 1),
(444, '2021-09-10 04:06:29', 1, 7, 80, 1, 1),
(445, '2021-09-10 04:07:05', 1, 7, 80, 1, 1),
(446, '2021-09-10 04:07:08', 1, 7, 80, 1, 1),
(447, '2021-09-10 04:07:21', 1, 7, 80, 1, 1),
(448, '2021-09-10 04:08:58', 1, 7, 80, 1, 1),
(449, '2021-09-10 04:14:08', 1, 7, 80, 1, 1),
(450, '2021-09-10 04:16:45', 1, 7, 80, 1, 1),
(451, '2021-09-10 04:19:04', 1, 7, 80, 1, 1),
(452, '2021-09-10 04:22:54', 1, 7, 80, 1, 1),
(453, '2021-09-10 04:22:57', 1, 7, 80, 1, 1),
(454, '2021-09-10 04:23:50', 1, 7, 80, 1, 1),
(455, '2021-09-10 04:23:52', 1, 7, 80, 1, 1),
(456, '2021-09-10 04:24:26', 1, 7, 80, 1, 1),
(457, '2021-09-10 04:24:28', 1, 7, 80, 1, 1),
(458, '2021-09-10 04:24:29', 1, 7, 80, 1, 1),
(459, '2021-09-10 04:24:35', 1, 7, 84, 1, 1),
(460, '2021-09-10 04:25:46', 1, 7, 80, 1, 1),
(461, '2021-09-10 04:26:14', 1, 7, 80, 1, 1),
(462, '2021-09-10 04:26:16', 1, 7, 80, 1, 1),
(463, '2021-09-10 04:26:17', 1, 7, 80, 1, 1),
(464, '2021-09-10 04:26:42', 1, 7, 80, 1, 1),
(465, '2021-09-10 04:27:28', 1, 7, 80, 1, 1),
(466, '2021-09-10 04:28:57', 1, 7, 80, 1, 1),
(467, '2021-09-10 04:29:08', 1, 7, 80, 1, 1),
(468, '2021-09-10 04:31:51', 1, 7, 80, 1, 1),
(469, '2021-09-10 04:32:17', 1, 7, 80, 1, 1),
(470, '2021-09-10 04:33:00', 1, 7, 80, 1, 1),
(471, '2021-09-10 04:36:33', 1, 7, 80, 1, 1),
(472, '2021-09-10 04:37:55', 1, 7, 80, 1, 1),
(473, '2021-09-10 04:38:31', 1, 7, 80, 1, 1),
(474, '2021-09-10 04:38:35', 1, 7, 80, 1, 1),
(475, '2021-09-10 04:38:57', 1, 7, 80, 1, 1),
(476, '2021-09-10 04:40:27', 1, 7, 80, 1, 1),
(477, '2021-09-10 04:40:58', 1, 7, 80, 1, 1),
(478, '2021-09-10 04:40:59', 1, 7, 80, 1, 1),
(479, '2021-09-10 04:41:58', 1, 7, 80, 1, 1),
(480, '2021-09-10 04:45:02', 1, 7, 80, 1, 1),
(481, '2021-09-10 04:46:07', 1, 7, 80, 1, 1),
(482, '2021-09-10 04:46:08', 1, 7, 80, 1, 1),
(483, '2021-09-10 04:46:10', 1, 7, 80, 1, 1),
(484, '2021-09-10 04:46:44', 1, 7, 80, 1, 1),
(485, '2021-09-10 04:47:19', 1, 7, 80, 1, 1),
(486, '2021-09-10 04:47:20', 1, 7, 80, 1, 1),
(487, '2021-09-10 04:47:25', 1, 7, 80, 1, 1),
(488, '2021-09-10 04:47:27', 1, 7, 80, 1, 1),
(489, '2021-09-10 04:47:48', 1, 7, 80, 1, 1),
(490, '2021-09-10 04:48:30', 1, 7, 80, 1, 1),
(491, '2021-09-10 04:49:00', 1, 7, 80, 1, 1),
(492, '2021-09-10 04:49:02', 1, 7, 80, 1, 1),
(493, '2021-09-10 04:49:15', 1, 7, 80, 1, 1),
(494, '2021-09-10 04:49:33', 1, 15, 80, 1, 1),
(495, '2021-09-10 04:49:47', 1, 15, 80, 1, 1),
(496, '2021-09-10 04:49:54', 1, 11, 80, 1, 1),
(497, '2021-09-10 04:50:58', 1, 11, 80, 1, 1),
(498, '2021-09-10 04:51:04', 1, 11, 80, 1, 1),
(499, '2021-09-10 04:51:08', 1, 11, 80, 1, 1),
(500, '2021-09-10 04:52:05', 1, 11, 80, 1, 1),
(501, '2021-09-10 04:52:31', 1, 11, 80, 1, 1),
(502, '2021-09-10 04:52:32', 1, 11, 80, 1, 1),
(503, '2021-09-10 04:52:35', 1, 11, 85, 1, 1),
(504, '2021-09-10 04:53:16', 1, 11, 80, 1, 1),
(505, '2021-09-10 04:53:54', 1, 11, 80, 1, 1),
(506, '2021-09-10 04:54:32', 1, 11, 80, 1, 1),
(507, '2021-09-10 04:54:53', 1, 11, 80, 1, 1),
(508, '2021-09-10 04:55:44', 1, 11, 80, 1, 1),
(509, '2021-09-10 04:56:06', 1, 11, 80, 1, 1),
(510, '2021-09-10 04:56:26', 1, 11, 80, 1, 1),
(511, '2021-09-10 04:56:51', 1, 11, 80, 1, 1),
(512, '2021-09-10 04:57:06', 1, 7, 80, 1, 1),
(513, '2021-09-10 04:58:07', 1, 7, 80, 1, 1),
(514, '2021-09-10 04:58:36', 1, 7, 80, 1, 1),
(515, '2021-09-10 04:58:47', 1, 7, 80, 1, 1),
(516, '2021-09-10 05:00:12', 1, 7, 80, 1, 1),
(517, '2021-09-10 05:00:26', 1, 9, 80, 1, 1),
(518, '2021-09-10 05:02:33', 1, 7, 80, 1, 1),
(519, '2021-09-10 05:03:22', 1, 7, 80, 1, 1),
(520, '2021-09-10 05:06:46', 1, 7, 80, 1, 1),
(521, '2021-09-10 05:07:22', 1, 7, 80, 1, 1),
(522, '2021-09-10 05:07:24', 1, 7, 80, 1, 1),
(523, '2021-09-10 05:07:30', 1, 7, 80, 1, 1),
(524, '2021-09-10 05:08:00', 1, 7, 80, 1, 1),
(525, '2021-09-10 05:08:27', 1, 7, 80, 1, 1),
(526, '2021-09-10 05:08:54', 1, 7, 80, 1, 1),
(527, '2021-09-10 05:08:59', 1, 7, 80, 1, 1),
(528, '2021-09-10 05:09:46', 1, 7, 80, 1, 1),
(529, '2021-09-10 05:09:48', 1, 7, 80, 1, 1),
(530, '2021-09-10 05:10:01', 1, 7, 80, 1, 1),
(531, '2021-09-10 05:10:11', 1, 7, 80, 1, 1),
(532, '2021-09-10 05:10:33', 1, 7, 80, 1, 1),
(533, '2021-09-10 05:10:59', 1, 7, 80, 1, 1),
(534, '2021-09-10 05:11:00', 1, 7, 80, 1, 1),
(535, '2021-09-10 05:11:20', 1, 7, 80, 1, 1),
(536, '2021-09-10 05:11:21', 1, 7, 80, 1, 1),
(537, '2021-09-10 05:11:25', 1, 7, 80, 1, 1),
(538, '2021-09-10 05:11:26', 1, 7, 80, 1, 1),
(539, '2021-09-10 05:11:38', 1, 7, 80, 1, 1),
(540, '2021-09-10 05:11:41', 1, 7, 80, 1, 1),
(541, '2021-09-10 05:11:55', 1, 7, 80, 1, 1),
(542, '2021-09-10 05:12:44', 1, 7, 80, 1, 1),
(543, '2021-09-10 05:12:45', 1, 7, 80, 1, 1),
(544, '2021-09-10 05:13:09', 1, 7, 80, 1, 1),
(545, '2021-09-10 05:13:44', 1, 7, 80, 1, 1),
(546, '2021-09-10 05:13:46', 1, 7, 80, 1, 1),
(547, '2021-09-10 05:13:53', 1, 7, 80, 1, 1),
(548, '2021-09-10 05:14:10', 1, 7, 80, 1, 1),
(549, '2021-09-10 05:14:14', 1, 7, 80, 1, 1),
(550, '2021-09-10 05:15:12', 1, 7, 80, 1, 1),
(551, '2021-09-10 05:15:14', 1, 7, 80, 1, 1),
(552, '2021-09-10 05:15:15', 1, 7, 80, 1, 1),
(553, '2021-09-10 05:15:41', 1, 7, 80, 1, 1),
(554, '2021-09-10 05:15:42', 1, 7, 80, 1, 1),
(555, '2021-09-10 05:16:04', 1, 7, 80, 1, 1),
(556, '2021-09-10 05:17:18', 1, 7, 80, 1, 1),
(557, '2021-09-10 05:18:20', 1, 7, 80, 1, 1),
(558, '2021-09-10 05:18:33', 1, 13, 80, 1, 1),
(559, '2021-09-10 05:18:57', 1, 13, 86, 1, 1),
(560, '2021-09-10 05:19:42', 1, 13, 80, 1, 1),
(561, '2021-09-10 05:19:45', 1, 13, 80, 1, 1),
(562, '2021-09-10 05:20:57', 1, 13, 80, 1, 1),
(563, '2021-09-10 05:20:58', 1, 13, 80, 1, 1),
(564, '2021-09-10 05:21:24', 1, 13, 80, 1, 1),
(565, '2021-09-10 05:21:31', 1, 13, 80, 1, 1),
(566, '2021-09-10 05:24:03', 1, 13, 80, 1, 1),
(567, '2021-09-10 05:26:52', 1, 13, 80, 1, 1),
(568, '2021-09-10 05:26:59', 1, 13, 80, 1, 1),
(569, '2021-09-10 05:27:07', 1, 13, 80, 1, 1),
(570, '2021-09-10 05:27:30', 1, 13, 80, 1, 1),
(571, '2021-09-10 05:27:39', 1, 13, 80, 1, 1),
(572, '2021-09-10 05:27:46', 1, 7, 80, 1, 1),
(573, '2021-09-10 05:28:04', 1, 7, 80, 1, 1),
(574, '2021-09-10 05:28:24', 1, 7, 80, 1, 1),
(575, '2021-09-10 05:28:33', 1, 13, 80, 1, 1),
(576, '2021-09-10 05:28:41', 1, 13, 80, 1, 1),
(577, '2021-09-10 05:31:14', 1, 13, 80, 1, 1),
(578, '2021-09-10 05:31:18', 1, 13, 80, 1, 1),
(579, '2021-09-10 05:31:53', 1, 13, 80, 1, 1),
(580, '2021-09-10 05:31:59', 1, 7, 80, 1, 1),
(581, '2021-09-10 05:32:22', 1, 7, 80, 1, 1),
(582, '2021-09-10 05:32:25', 1, 13, 80, 1, 1),
(583, '2021-09-10 05:32:31', 1, 7, 80, 1, 1),
(584, '2021-09-10 05:32:52', 1, 7, 80, 1, 1),
(585, '2021-09-10 05:32:58', 1, 13, 80, 1, 1),
(586, '2021-09-10 05:36:47', 1, 13, 80, 1, 1),
(587, '2021-09-10 05:37:34', 1, 13, 80, 1, 1),
(588, '2021-09-10 05:38:16', 1, 13, 80, 1, 1),
(589, '2021-09-10 05:38:17', 1, 13, 80, 1, 1),
(590, '2021-09-13 04:04:36', 1, 13, 87, 1, 1),
(591, '2021-09-13 04:07:55', 1, 7, 87, 1, 1),
(592, '2021-09-13 04:08:13', 1, 15, 87, 1, 1),
(593, '2021-09-13 04:21:06', 1, 8, 87, 1, 1),
(594, '2021-09-13 04:25:45', 4, 8, 87, 1, 1),
(595, '2021-09-13 04:25:53', 1, 7, 87, 1, 1),
(596, '2021-09-14 03:13:42', 1, 13, 92, 1, 1),
(597, '2021-09-14 03:15:01', 1, 13, 92, 1, 1),
(598, '2021-09-14 03:15:05', 1, 13, 92, 1, 1),
(599, '2021-09-14 03:15:48', 1, 13, 92, 1, 1),
(600, '2021-09-14 03:15:52', 1, 13, 94, 1, 1),
(601, '2021-09-14 03:19:50', 1, 13, 92, 1, 1),
(602, '2021-09-14 03:19:52', 1, 13, 92, 1, 1),
(603, '2021-09-14 03:20:26', 1, 13, 92, 1, 1),
(604, '2021-09-14 03:20:27', 1, 13, 92, 1, 1),
(605, '2021-09-14 03:21:10', 1, 13, 92, 1, 1),
(606, '2021-09-14 03:23:00', 1, 13, 92, 1, 1),
(607, '2021-09-14 03:25:40', 1, 13, 92, 1, 1),
(608, '2021-09-14 03:25:42', 1, 13, 92, 1, 1),
(609, '2021-09-14 03:26:42', 1, 13, 92, 1, 1),
(610, '2021-09-14 03:27:01', 1, 13, 92, 1, 1),
(611, '2021-09-14 03:27:03', 1, 13, 92, 1, 1),
(612, '2021-09-14 03:27:52', 1, 13, 92, 1, 1),
(613, '2021-09-14 03:27:54', 1, 13, 92, 1, 1),
(614, '2021-09-14 03:28:46', 1, 13, 92, 1, 1),
(615, '2021-09-14 03:29:00', 1, 13, 2, 0, 1),
(616, '2021-09-14 03:29:06', 5, 13, 2, 0, 1),
(617, '2021-09-14 03:33:38', 1, 10, 2, 0, 1),
(618, '2021-09-14 03:33:47', 1, 10, 2, 0, 1),
(619, '2021-09-14 03:34:53', 1, 12, 2, 0, 1),
(620, '2021-09-20 22:36:21', 1, 14, 95, 1, 1),
(621, '2021-09-20 22:36:31', 1, 13, 95, 1, 1),
(622, '2021-09-20 22:44:23', 1, 12, 95, 1, 1),
(623, '2021-09-20 22:44:29', 1, 14, 95, 1, 1),
(624, '2021-09-20 22:44:35', 1, 8, 95, 1, 1),
(625, '2021-09-20 22:44:41', 4, 8, 95, 1, 1),
(626, '2021-09-20 22:46:57', 1, 14, 95, 1, 1),
(627, '2021-09-20 22:47:02', 1, 14, 95, 1, 1),
(628, '2021-09-20 22:47:31', 4, 11, 95, 1, 1),
(629, '2021-09-20 22:47:57', 4, 11, 95, 1, 1),
(630, '2021-09-20 22:48:58', 1, 13, 95, 1, 1),
(631, '2021-09-20 22:51:25', 1, 9, 95, 1, 1),
(632, '2021-09-20 22:53:09', 4, 9, 95, 1, 1),
(633, '2021-09-21 00:40:14', 1, 14, 96, 1, 1),
(634, '2021-09-21 00:40:21', 1, 14, 96, 1, 1),
(635, '2021-09-21 00:40:29', 1, 14, 96, 1, 1),
(636, '2021-09-21 00:40:33', 4, 7, 96, 1, 1),
(637, '2021-09-21 00:42:07', 4, 7, 2, 0, 1),
(638, '2021-09-21 00:46:05', 1, 14, 98, 1, 1),
(639, '2021-09-21 00:49:55', 1, 7, 98, 1, 1),
(640, '2021-09-21 00:49:59', 1, 15, 98, 1, 1),
(641, '2021-09-21 00:50:21', 1, 14, 98, 1, 1),
(642, '2021-09-21 00:54:30', 1, 13, 98, 1, 1),
(643, '2021-09-21 05:43:14', 4, 11, 2, 0, 1),
(644, '2021-09-21 05:43:24', 4, 8, 2, 0, 1),
(645, '2021-09-21 05:48:34', 1, 10, 2, 0, 1),
(646, '2021-09-21 05:48:39', 1, 13, 2, 0, 1),
(647, '2021-09-23 04:16:26', 4, 11, 108, 1, 1),
(648, '2021-09-23 04:16:33', 1, 9, 108, 1, 1),
(649, '2021-09-23 18:05:40', 1, 13, 110, 1, 1),
(650, '2021-09-24 03:56:02', 1, 13, 113, 1, 1),
(651, '2021-09-24 03:58:00', 1, 15, 113, 1, 1),
(652, '2021-09-26 22:42:37', 1, 13, 116, 1, 1),
(653, '2021-09-26 22:58:20', 1, 13, 116, 1, 1),
(654, '2021-09-26 23:00:24', 1, 13, 116, 1, 1),
(655, '2021-09-26 23:16:59', 1, 13, 116, 1, 1),
(656, '2021-10-07 18:46:27', 1, 10, 123, 1, 1),
(657, '2021-10-07 18:47:32', 1, 10, 123, 1, 1),
(658, '2021-10-07 18:47:37', 1, 10, 123, 1, 1),
(659, '2021-10-10 22:25:47', 1, 14, 129, 1, 1),
(660, '2021-10-10 22:28:25', 1, 7, 129, 1, 1),
(661, '2021-10-10 23:48:43', 1, 11, 132, 1, 1),
(662, '2021-10-11 00:26:47', 1, 7, 132, 1, 1),
(663, '2021-10-11 00:27:43', 1, 15, 132, 1, 1),
(664, '2021-10-11 00:27:52', 1, 15, 132, 1, 1),
(665, '2021-10-11 00:29:59', 1, 15, 132, 1, 1),
(666, '2021-10-11 00:30:02', 1, 7, 132, 1, 1),
(667, '2021-10-11 00:31:27', 1, 15, 132, 1, 1),
(668, '2021-10-11 00:31:36', 1, 8, 132, 1, 1),
(669, '2021-10-11 00:35:29', 1, 15, 132, 1, 1),
(670, '2021-10-11 00:35:34', 1, 15, 132, 1, 1),
(671, '2021-10-11 00:35:41', 1, 10, 132, 1, 1),
(672, '2021-10-11 00:35:45', 1, 14, 132, 1, 1),
(673, '2021-10-11 00:42:15', 1, 15, 132, 1, 1),
(674, '2021-10-11 00:42:21', 1, 13, 132, 1, 1),
(675, '2021-10-11 00:44:05', 1, 15, 132, 1, 1),
(676, '2021-10-11 00:44:12', 1, 10, 132, 1, 1),
(677, '2021-10-11 00:44:15', 1, 15, 132, 1, 1),
(678, '2021-10-11 00:44:19', 1, 14, 132, 1, 1),
(679, '2021-10-11 00:47:02', 1, 15, 132, 1, 1),
(680, '2021-10-11 00:47:09', 1, 13, 132, 1, 1),
(681, '2021-10-11 00:47:31', 1, 13, 132, 1, 1),
(682, '2021-10-11 00:47:38', 1, 12, 132, 1, 1),
(683, '2021-10-11 00:47:41', 1, 15, 132, 1, 1),
(684, '2021-10-11 00:47:43', 1, 9, 132, 1, 1),
(685, '2021-10-11 00:47:45', 1, 10, 132, 1, 1),
(686, '2021-10-11 00:47:50', 1, 9, 132, 1, 1),
(687, '2021-10-11 00:47:52', 1, 11, 132, 1, 1),
(688, '2021-10-11 00:47:54', 1, 12, 132, 1, 1),
(689, '2021-10-11 00:47:58', 1, 12, 132, 1, 1),
(690, '2021-10-11 00:47:59', 1, 12, 132, 1, 1),
(691, '2021-10-11 00:48:02', 1, 13, 132, 1, 1),
(692, '2021-10-11 00:48:05', 1, 12, 132, 1, 1),
(693, '2021-10-11 00:49:44', 1, 9, 132, 1, 1),
(694, '2021-10-11 00:49:49', 1, 9, 132, 1, 1),
(695, '2021-10-11 00:49:51', 1, 8, 132, 1, 1),
(696, '2021-10-11 00:49:53', 1, 13, 132, 1, 1),
(697, '2021-10-11 00:51:02', 1, 11, 132, 1, 1),
(698, '2021-10-11 00:51:07', 1, 14, 132, 1, 1),
(699, '2021-10-11 00:51:18', 1, 14, 132, 1, 1),
(700, '2021-10-11 00:51:22', 1, 14, 132, 1, 1),
(701, '2021-10-11 00:51:41', 1, 13, 132, 1, 1),
(702, '2021-10-11 00:51:45', 1, 13, 132, 1, 1),
(703, '2021-10-11 00:51:47', 1, 13, 132, 1, 1),
(704, '2021-10-11 00:51:57', 1, 8, 132, 1, 1),
(705, '2021-10-11 00:52:11', 1, 7, 132, 1, 1),
(706, '2021-10-11 00:52:12', 1, 8, 132, 1, 1),
(707, '2021-10-11 00:52:12', 1, 13, 132, 1, 1),
(708, '2021-10-11 00:52:13', 1, 8, 132, 1, 1),
(709, '2021-10-11 00:52:14', 1, 13, 132, 1, 1),
(710, '2021-10-11 00:52:15', 1, 11, 132, 1, 1),
(711, '2021-10-11 00:52:15', 1, 12, 132, 1, 1),
(712, '2021-10-11 00:52:18', 1, 9, 132, 1, 1),
(713, '2021-10-11 00:52:19', 1, 14, 132, 1, 1),
(714, '2021-10-11 00:52:19', 1, 7, 132, 1, 1),
(715, '2021-10-11 00:52:21', 1, 15, 132, 1, 1),
(716, '2021-10-11 00:52:23', 1, 10, 132, 1, 1),
(717, '2021-10-11 00:52:28', 1, 10, 132, 1, 1),
(718, '2021-10-11 00:52:33', 1, 10, 132, 1, 1),
(719, '2021-10-11 00:52:55', 1, 13, 132, 1, 1),
(720, '2021-10-11 00:52:56', 1, 13, 134, 1, 1),
(721, '2021-10-11 00:52:59', 1, 13, 132, 1, 1),
(722, '2021-10-11 00:53:00', 1, 13, 132, 1, 1),
(723, '2021-10-11 00:53:08', 1, 13, 132, 1, 1),
(724, '2021-10-11 00:53:12', 1, 13, 135, 1, 1),
(725, '2021-10-11 00:53:56', 1, 10, 132, 1, 1),
(726, '2021-10-11 00:54:02', 1, 10, 132, 1, 1),
(727, '2021-10-11 00:54:06', 1, 11, 132, 1, 1),
(728, '2021-10-11 00:54:08', 1, 11, 132, 1, 1),
(729, '2021-10-11 00:54:13', 1, 11, 132, 1, 1),
(730, '2021-10-11 00:54:14', 1, 11, 132, 1, 1),
(731, '2021-10-11 00:54:17', 1, 11, 136, 1, 1),
(732, '2021-10-11 00:54:22', 1, 11, 132, 1, 1),
(733, '2021-10-11 00:54:24', 1, 11, 132, 1, 1),
(734, '2021-10-11 00:54:28', 1, 11, 132, 1, 1),
(735, '2021-10-11 00:54:34', 1, 13, 132, 1, 1),
(736, '2021-10-11 04:18:54', 1, 15, 137, 1, 1),
(737, '2021-10-11 04:18:56', 1, 13, 137, 1, 1),
(738, '2021-10-11 04:18:58', 1, 12, 137, 1, 1),
(739, '2021-10-11 04:19:00', 1, 14, 137, 1, 1),
(740, '2021-10-11 04:19:06', 1, 8, 137, 1, 1),
(741, '2021-10-11 04:19:10', 1, 13, 137, 1, 1),
(742, '2021-10-11 04:19:14', 1, 13, 137, 1, 1),
(743, '2021-10-11 04:19:23', 1, 14, 137, 1, 1),
(744, '2021-10-11 04:19:26', 1, 13, 137, 1, 1),
(745, '2021-10-11 04:19:26', 1, 12, 137, 1, 1),
(746, '2021-10-11 04:20:04', 1, 13, 137, 1, 1),
(747, '2021-10-11 04:20:07', 1, 13, 137, 1, 1),
(748, '2021-10-11 04:20:39', 1, 7, 137, 1, 1),
(749, '2021-10-11 04:20:47', 1, 9, 137, 1, 1),
(750, '2021-10-11 04:21:33', 1, 15, 137, 1, 1),
(751, '2021-10-11 04:26:22', 1, 11, 137, 1, 1),
(752, '2021-10-11 04:26:26', 1, 9, 137, 1, 1),
(753, '2021-10-11 04:26:31', 1, 10, 137, 1, 1),
(754, '2021-10-11 04:29:46', 1, 10, 137, 1, 1),
(755, '2021-10-11 04:29:54', 1, 13, 137, 1, 1),
(756, '2021-10-11 04:30:10', 1, 13, 137, 1, 1),
(757, '2021-10-11 04:30:15', 1, 13, 139, 1, 1),
(758, '2021-10-11 04:31:12', 1, 14, 137, 1, 1),
(759, '2021-10-11 04:32:30', 1, 7, 137, 1, 1),
(760, '2021-10-11 04:33:43', 1, 15, 137, 1, 1),
(761, '2021-10-11 04:33:49', 1, 15, 137, 1, 1),
(762, '2021-10-11 04:33:53', 1, 15, 140, 1, 1),
(763, '2021-10-11 04:33:56', 1, 15, 137, 1, 1),
(764, '2021-10-11 04:34:00', 1, 15, 137, 1, 1),
(765, '2021-10-11 04:34:02', 1, 15, 137, 1, 1),
(766, '2021-10-11 04:34:12', 1, 15, 141, 1, 1),
(767, '2021-10-11 04:34:47', 1, 7, 137, 1, 1),
(768, '2021-10-11 04:34:50', 1, 10, 137, 1, 1),
(769, '2021-10-11 04:34:57', 1, 15, 137, 1, 1),
(770, '2021-10-11 04:34:59', 1, 10, 137, 1, 1),
(771, '2021-10-11 04:35:07', 1, 10, 137, 1, 1),
(772, '2021-10-11 04:37:21', 1, 15, 137, 1, 1),
(773, '2021-10-11 04:37:26', 1, 10, 137, 1, 1),
(774, '2021-10-11 04:37:37', 1, 15, 137, 1, 1),
(775, '2021-10-11 04:38:44', 1, 10, 137, 1, 1),
(776, '2021-10-11 04:38:44', 1, 10, 137, 1, 1),
(777, '2021-10-11 04:38:51', 1, 7, 137, 1, 1),
(778, '2021-10-11 04:39:01', 1, 10, 137, 1, 1),
(779, '2021-10-11 18:57:49', 1, 11, 142, 1, 1),
(780, '2021-10-12 05:57:49', 1, 14, 143, 1, 1),
(781, '2021-10-14 06:57:05', 1, 15, 145, 1, 1),
(782, '2021-10-17 23:24:03', 1, 15, 146, 1, 1),
(783, '2021-10-17 23:54:34', 1, 7, 146, 1, 1),
(784, '2021-10-17 23:57:36', 1, 7, 146, 1, 1),
(785, '2021-10-17 23:57:39', 1, 7, 146, 1, 1),
(786, '2021-10-17 23:58:16', 1, 7, 146, 1, 1),
(787, '2021-10-17 23:59:28', 1, 7, 146, 1, 1),
(788, '2021-10-17 23:59:32', 1, 7, 147, 1, 1),
(789, '2021-10-18 00:15:07', 1, 7, 146, 1, 1),
(790, '2021-10-18 00:16:28', 1, 7, 146, 1, 1),
(791, '2021-10-18 00:17:13', 1, 7, 146, 1, 1),
(792, '2021-10-18 00:17:15', 1, 7, 146, 1, 1),
(793, '2021-10-18 00:17:22', 1, 7, 146, 1, 1),
(794, '2021-10-18 00:17:39', 1, 13, 146, 1, 1),
(795, '2021-10-18 00:18:12', 1, 13, 146, 1, 1),
(796, '2021-10-18 00:23:23', 1, 13, 146, 1, 1),
(797, '2021-10-18 00:23:32', 1, 13, 146, 1, 1),
(798, '2021-10-18 00:23:35', 1, 13, 146, 1, 1),
(799, '2021-10-18 00:26:14', 1, 13, 146, 1, 1),
(800, '2021-10-18 00:26:18', 1, 13, 148, 1, 1),
(801, '2021-10-18 00:26:55', 1, 13, 146, 1, 1),
(802, '2021-10-18 00:29:50', 1, 13, 146, 1, 1),
(803, '2021-10-18 00:30:30', 1, 13, 146, 1, 1),
(804, '2021-10-18 00:31:11', 1, 13, 146, 1, 1),
(805, '2021-10-18 00:31:19', 1, 13, 146, 1, 1),
(806, '2021-10-18 00:32:28', 1, 13, 146, 1, 1),
(807, '2021-10-18 00:32:30', 1, 13, 146, 1, 1),
(808, '2021-10-18 00:32:35', 1, 13, 146, 1, 1),
(809, '2021-10-18 00:32:49', 1, 13, 146, 1, 1),
(810, '2021-10-18 00:32:55', 1, 13, 146, 1, 1),
(811, '2021-10-18 00:35:36', 1, 13, 146, 1, 1),
(812, '2021-10-18 00:35:38', 1, 13, 146, 1, 1),
(813, '2021-10-18 00:36:01', 1, 13, 146, 1, 1),
(814, '2021-10-18 00:36:02', 1, 13, 146, 1, 1),
(815, '2021-10-18 00:36:19', 1, 13, 146, 1, 1),
(816, '2021-10-18 00:36:24', 1, 13, 146, 1, 1),
(817, '2021-10-18 00:37:12', 1, 13, 146, 1, 1),
(818, '2021-10-18 00:40:04', 1, 13, 146, 1, 1),
(819, '2021-10-18 00:40:22', 1, 13, 146, 1, 1),
(820, '2021-10-18 00:40:58', 1, 13, 146, 1, 1),
(821, '2021-10-18 00:43:32', 1, 13, 146, 1, 1),
(822, '2021-10-18 00:44:49', 1, 13, 146, 1, 1),
(823, '2021-10-18 00:45:14', 1, 13, 146, 1, 1),
(824, '2021-10-18 00:50:26', 1, 13, 146, 1, 1),
(825, '2021-10-18 00:52:02', 1, 13, 146, 1, 1),
(826, '2021-10-18 00:52:20', 1, 13, 146, 1, 1),
(827, '2021-10-18 00:52:42', 1, 13, 146, 1, 1),
(828, '2021-10-18 00:52:44', 1, 13, 146, 1, 1),
(829, '2021-10-18 00:52:45', 1, 13, 146, 1, 1),
(830, '2021-10-18 00:54:05', 1, 13, 146, 1, 1),
(831, '2021-10-18 00:54:13', 1, 13, 146, 1, 1),
(832, '2021-10-18 00:54:14', 1, 13, 146, 1, 1),
(833, '2021-10-18 00:57:22', 1, 13, 146, 1, 1),
(834, '2021-10-18 00:57:31', 1, 13, 146, 1, 1),
(835, '2021-10-18 00:57:33', 1, 13, 146, 1, 1),
(836, '2021-10-18 00:57:35', 1, 13, 146, 1, 1),
(837, '2021-10-18 00:58:02', 1, 13, 146, 1, 1),
(838, '2021-10-18 00:58:04', 1, 13, 146, 1, 1),
(839, '2021-10-18 00:58:35', 1, 13, 146, 1, 1),
(840, '2021-10-18 00:59:00', 1, 13, 146, 1, 1),
(841, '2021-10-18 00:59:08', 1, 13, 146, 1, 1),
(842, '2021-10-18 00:59:17', 1, 13, 146, 1, 1),
(843, '2021-10-18 00:59:59', 1, 13, 146, 1, 1),
(844, '2021-10-18 01:05:57', 1, 13, 146, 1, 1),
(845, '2021-10-18 01:06:32', 1, 13, 146, 1, 1),
(846, '2021-10-18 01:07:33', 1, 13, 146, 1, 1),
(847, '2021-10-18 01:07:52', 1, 13, 146, 1, 1),
(848, '2021-10-18 01:08:06', 1, 13, 146, 1, 1),
(849, '2021-10-18 01:08:20', 1, 13, 146, 1, 1),
(850, '2021-10-18 01:08:25', 1, 13, 149, 1, 1),
(851, '2021-10-18 01:09:39', 1, 13, 146, 1, 1),
(852, '2021-10-18 01:09:52', 1, 13, 146, 1, 1),
(853, '2021-10-18 01:10:24', 1, 13, 146, 1, 1),
(854, '2021-10-18 01:10:32', 1, 13, 146, 1, 1),
(855, '2021-10-18 01:10:44', 1, 13, 146, 1, 1),
(856, '2021-10-18 01:13:25', 1, 13, 146, 1, 1),
(857, '2021-10-18 01:13:37', 1, 13, 146, 1, 1),
(858, '2021-10-18 01:14:32', 1, 13, 146, 1, 1),
(859, '2021-10-18 01:14:41', 1, 13, 146, 1, 1),
(860, '2021-10-18 01:14:48', 1, 13, 146, 1, 1),
(861, '2021-10-18 01:17:08', 1, 13, 146, 1, 1),
(862, '2021-10-18 01:19:34', 1, 13, 146, 1, 1),
(863, '2021-10-18 01:20:24', 1, 13, 146, 1, 1),
(864, '2021-10-18 01:21:27', 1, 13, 146, 1, 1),
(865, '2021-10-18 01:21:30', 1, 13, 146, 1, 1),
(866, '2021-10-18 01:21:46', 1, 13, 146, 1, 1),
(867, '2021-10-18 01:22:46', 1, 13, 146, 1, 1),
(868, '2021-10-18 01:23:39', 1, 13, 146, 1, 1),
(869, '2021-10-18 01:23:56', 1, 13, 146, 1, 1),
(870, '2021-10-18 04:00:44', 1, 11, 150, 1, 1),
(871, '2021-10-18 05:11:06', 1, 10, 2, 0, 1),
(872, '2021-10-18 05:12:48', 1, 10, 151, 1, 1),
(873, '2021-10-18 05:13:04', 1, 10, 151, 1, 1),
(874, '2021-10-18 05:13:06', 1, 10, 151, 1, 1),
(875, '2021-10-18 05:13:30', 1, 7, 151, 1, 1),
(876, '2021-10-18 05:13:56', 1, 14, 151, 1, 1),
(877, '2021-10-18 05:14:40', 1, 14, 152, 1, 1),
(878, '2021-10-18 05:15:09', 1, 14, 2, 0, 1),
(879, '2021-10-18 05:15:11', 1, 14, 2, 0, 1),
(880, '2021-10-18 05:15:16', 1, 14, 2, 0, 1),
(881, '2021-10-18 05:16:07', 1, 14, 2, 0, 1),
(882, '2021-10-18 05:17:16', 1, 14, 2, 0, 1),
(883, '2021-10-18 05:17:18', 1, 14, 2, 0, 1),
(884, '2021-10-18 05:17:29', 1, 14, 2, 0, 1),
(885, '2021-10-18 05:19:06', 1, 14, 2, 0, 1),
(886, '2021-10-18 05:19:08', 1, 14, 2, 0, 1),
(887, '2021-10-18 05:21:24', 1, 14, 2, 0, 1),
(888, '2021-10-18 05:21:33', 1, 14, 2, 0, 1),
(889, '2021-10-18 05:23:40', 1, 14, 2, 0, 1),
(890, '2021-10-18 05:24:28', 1, 14, 2, 0, 1),
(891, '2021-10-18 05:24:55', 1, 14, 2, 0, 1),
(892, '2021-10-18 05:33:44', 1, 14, 2, 0, 1),
(893, '2021-10-18 05:33:57', 1, 14, 2, 0, 1),
(894, '2021-10-18 05:35:05', 1, 14, 2, 0, 1),
(895, '2021-10-18 05:35:12', 1, 14, 2, 0, 1),
(896, '2021-10-18 05:35:19', 1, 14, 2, 0, 1),
(897, '2021-10-18 05:39:23', 1, 14, 2, 0, 1),
(898, '2021-10-18 05:39:50', 1, 14, 2, 0, 1),
(899, '2021-10-18 05:45:27', 1, 14, 2, 0, 1),
(900, '2021-10-19 22:04:02', 1, 7, 153, 1, 1),
(901, '2021-10-19 22:04:26', 1, 7, 154, 1, 1),
(902, '2021-10-19 22:06:06', 1, 7, 153, 1, 1),
(903, '2021-10-19 22:06:41', 1, 7, 153, 1, 1),
(904, '2021-10-19 22:06:51', 1, 7, 153, 1, 1),
(905, '2021-10-19 22:06:58', 1, 7, 153, 1, 1),
(906, '2021-10-19 22:08:33', 1, 7, 153, 1, 1),
(907, '2021-10-19 22:09:05', 1, 7, 153, 1, 1),
(908, '2021-10-19 22:09:20', 1, 7, 153, 1, 1),
(909, '2021-10-19 22:09:22', 1, 7, 153, 1, 1),
(910, '2021-10-19 22:09:31', 1, 7, 153, 1, 1),
(911, '2021-10-19 22:09:36', 1, 7, 153, 1, 1),
(912, '2021-10-19 22:09:38', 1, 7, 153, 1, 1),
(913, '2021-10-19 22:09:45', 1, 7, 153, 1, 1),
(914, '2021-10-19 22:09:52', 1, 7, 153, 1, 1),
(915, '2021-10-19 22:09:54', 1, 7, 153, 1, 1),
(916, '2021-10-19 22:10:01', 1, 7, 153, 1, 1),
(917, '2021-10-19 22:10:55', 1, 7, 153, 1, 1),
(918, '2021-10-19 22:11:11', 1, 7, 153, 1, 1),
(919, '2021-10-19 22:11:16', 1, 7, 153, 1, 1),
(920, '2021-10-19 22:11:32', 1, 7, 153, 1, 1),
(921, '2021-10-19 22:11:41', 1, 7, 153, 1, 1),
(922, '2021-10-19 22:11:43', 1, 7, 153, 1, 1),
(923, '2021-10-19 22:12:13', 1, 7, 153, 1, 1),
(924, '2021-10-19 22:12:42', 1, 7, 153, 1, 1),
(925, '2021-10-19 22:12:52', 1, 7, 153, 1, 1),
(926, '2021-10-19 22:14:51', 1, 7, 153, 1, 1),
(927, '2021-10-19 22:15:16', 1, 7, 153, 1, 1),
(928, '2021-10-19 22:20:25', 1, 7, 153, 1, 1),
(929, '2021-10-19 22:20:44', 1, 7, 153, 1, 1),
(930, '2021-10-19 22:21:03', 1, 7, 153, 1, 1),
(931, '2021-10-19 22:21:11', 1, 7, 153, 1, 1),
(932, '2021-10-19 22:21:17', 1, 7, 153, 1, 1),
(933, '2021-10-19 22:21:58', 1, 7, 153, 1, 1),
(934, '2021-10-19 22:22:10', 1, 7, 153, 1, 1),
(935, '2021-10-19 22:22:22', 1, 7, 153, 1, 1),
(936, '2021-10-19 22:22:39', 1, 7, 153, 1, 1),
(937, '2021-10-19 22:26:37', 1, 7, 153, 1, 1),
(938, '2021-10-19 22:27:13', 1, 7, 153, 1, 1),
(939, '2021-10-19 22:27:18', 1, 7, 153, 1, 1),
(940, '2021-10-19 22:27:30', 1, 7, 153, 1, 1),
(941, '2021-10-19 22:27:51', 1, 7, 153, 1, 1),
(942, '2021-10-19 22:32:19', 1, 7, 153, 1, 1),
(943, '2021-10-19 22:33:09', 1, 7, 153, 1, 1),
(944, '2021-10-19 22:33:15', 1, 7, 155, 1, 1),
(945, '2021-10-19 22:33:48', 1, 7, 153, 1, 1),
(946, '2021-10-19 22:34:07', 1, 7, 153, 1, 1),
(947, '2021-10-19 22:34:14', 1, 7, 153, 1, 1),
(948, '2021-10-19 22:40:12', 1, 7, 153, 1, 1),
(949, '2021-10-19 22:43:02', 1, 7, 153, 1, 1),
(950, '2021-10-19 22:44:11', 1, 7, 153, 1, 1),
(951, '2021-10-19 22:45:26', 1, 7, 153, 1, 1),
(952, '2021-10-19 22:46:53', 1, 11, 153, 1, 1),
(953, '2021-10-19 22:51:08', 1, 11, 153, 1, 1),
(954, '2021-10-19 22:52:02', 1, 11, 153, 1, 1),
(955, '2021-10-19 22:52:05', 1, 11, 153, 1, 1),
(956, '2021-10-19 22:52:42', 1, 11, 153, 1, 1),
(957, '2021-10-19 22:52:44', 1, 11, 153, 1, 1),
(958, '2021-10-19 22:54:42', 1, 11, 153, 1, 1),
(959, '2021-10-19 22:59:29', 1, 11, 153, 1, 1),
(960, '2021-10-19 22:59:31', 1, 11, 153, 1, 1),
(961, '2021-10-19 22:59:32', 1, 11, 153, 1, 1),
(962, '2021-10-19 22:59:39', 1, 11, 153, 1, 1),
(963, '2021-10-19 22:59:44', 1, 11, 153, 1, 1),
(964, '2021-10-19 22:59:49', 1, 11, 153, 1, 1),
(965, '2021-10-19 23:00:29', 1, 11, 153, 1, 1),
(966, '2021-10-19 23:01:34', 1, 11, 153, 1, 1),
(967, '2021-10-19 23:01:46', 1, 11, 156, 1, 1),
(968, '2021-10-19 23:02:42', 1, 11, 153, 1, 1),
(969, '2021-10-19 23:02:45', 1, 11, 153, 1, 1),
(970, '2021-10-19 23:03:50', 1, 11, 153, 1, 1),
(971, '2021-10-19 23:03:52', 1, 11, 153, 1, 1),
(972, '2021-10-19 23:05:07', 1, 11, 153, 1, 1),
(973, '2021-10-19 23:06:16', 1, 11, 153, 1, 1),
(974, '2021-10-19 23:06:18', 1, 11, 153, 1, 1),
(975, '2021-10-19 23:09:11', 1, 11, 153, 1, 1),
(976, '2021-10-19 23:09:13', 1, 11, 153, 1, 1),
(977, '2021-10-19 23:09:51', 1, 11, 153, 1, 1),
(978, '2021-10-19 23:18:09', 1, 11, 153, 1, 1),
(979, '2021-10-19 23:22:36', 1, 11, 153, 1, 1),
(980, '2021-10-19 23:22:54', 1, 11, 153, 1, 1),
(981, '2021-10-19 23:22:57', 1, 11, 153, 1, 1),
(982, '2021-10-20 04:07:50', 1, 11, 157, 1, 1),
(983, '2021-10-20 05:15:17', 1, 11, 158, 1, 1),
(984, '2021-10-20 05:15:19', 1, 11, 158, 1, 1),
(985, '2021-10-20 05:16:02', 1, 11, 158, 1, 1),
(986, '2021-10-20 05:19:35', 1, 11, 159, 1, 1),
(987, '2021-10-20 05:24:25', 1, 11, 158, 1, 1),
(988, '2021-10-20 05:24:39', 1, 11, 158, 1, 1),
(989, '2021-10-20 05:24:51', 1, 13, 158, 1, 1),
(990, '2021-10-20 05:29:22', 1, 13, 158, 1, 1),
(991, '2021-10-20 05:29:28', 1, 13, 160, 1, 1),
(992, '2021-10-20 05:31:15', 1, 13, 158, 1, 1),
(993, '2021-10-20 05:32:50', 1, 13, 158, 1, 1),
(994, '2021-10-20 05:33:39', 1, 13, 158, 1, 1),
(995, '2021-10-20 05:33:41', 1, 13, 158, 1, 1),
(996, '2021-10-20 05:33:48', 1, 13, 158, 1, 1),
(997, '2021-10-20 05:34:01', 1, 13, 158, 1, 1),
(998, '2021-10-20 05:34:30', 1, 13, 158, 1, 1),
(999, '2021-10-20 05:36:35', 1, 13, 158, 1, 1),
(1000, '2021-10-20 05:36:40', 1, 13, 158, 1, 1),
(1001, '2021-10-20 05:36:42', 1, 13, 158, 1, 1),
(1002, '2021-10-20 05:36:49', 1, 13, 158, 1, 1),
(1003, '2021-10-20 05:36:51', 1, 13, 158, 1, 1),
(1004, '2021-10-20 05:36:56', 1, 13, 158, 1, 1),
(1005, '2021-10-20 05:37:15', 1, 13, 158, 1, 1),
(1006, '2021-10-20 05:37:18', 1, 13, 158, 1, 1),
(1007, '2021-10-20 05:37:32', 1, 13, 158, 1, 1),
(1008, '2021-10-20 05:37:51', 1, 7, 158, 1, 1),
(1009, '2021-10-20 05:37:57', 4, 7, 158, 1, 1),
(1010, '2021-11-18 05:25:39', 1, 14, 165, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_event_types`
--

CREATE TABLE `report_event_types` (
  `event_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';

--
-- Dumping data for table `report_event_types`
--

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 0),
(2, 'sendfriend_product', 0),
(3, 'catalog_product_compare_add_product', 0),
(4, 'checkout_cart_add_product', 0),
(5, 'wishlist_add_product', 0),
(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_index`
--

CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Index Id',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';

--
-- Dumping data for table `report_viewed_product_index`
--

INSERT INTO `report_viewed_product_index` (`index_id`, `visitor_id`, `customer_id`, `product_id`, `store_id`, `added_at`) VALUES
(332, 151, 2, 7, 1, '2021-10-18 05:15:08'),
(342, 87, 2, 8, 1, '2021-09-13 04:37:15'),
(349, 65, NULL, 7, 1, '2021-09-09 19:30:38'),
(350, 65, NULL, 9, 1, '2021-09-09 19:30:35'),
(351, 65, NULL, 10, 1, '2021-09-09 19:30:24'),
(354, 65, NULL, 11, 1, '2021-09-09 21:36:38'),
(356, 65, NULL, 12, 1, '2021-09-09 19:42:53'),
(357, 65, NULL, 8, 1, '2021-09-09 20:21:54'),
(359, 69, NULL, 11, 1, '2021-09-09 22:58:36'),
(360, 69, NULL, 7, 1, '2021-09-10 00:19:03'),
(361, 69, NULL, 13, 1, '2021-09-09 23:21:53'),
(371, 69, NULL, 14, 1, '2021-09-09 23:11:37'),
(372, 70, NULL, 14, 1, '2021-09-09 22:03:13'),
(373, 69, NULL, 15, 1, '2021-09-09 23:21:56'),
(375, 69, NULL, 9, 1, '2021-09-09 23:10:43'),
(381, 69, NULL, 8, 1, '2021-09-09 23:35:53'),
(398, 69, NULL, 10, 1, '2021-09-09 23:21:46'),
(401, 72, NULL, 9, 1, '2021-09-09 23:10:19'),
(407, 69, NULL, 12, 1, '2021-09-09 23:21:50'),
(408, 74, NULL, 12, 1, '2021-09-09 23:12:55'),
(415, 77, NULL, 15, 1, '2021-09-09 23:21:59'),
(419, 79, NULL, 13, 1, '2021-09-10 00:18:30'),
(421, 80, NULL, 10, 1, '2021-09-10 03:58:26'),
(422, 80, NULL, 7, 1, '2021-09-10 05:32:52'),
(423, 83, NULL, 7, 1, '2021-09-10 03:59:59'),
(444, 84, NULL, 7, 1, '2021-09-10 04:24:35'),
(479, 80, NULL, 15, 1, '2021-09-10 04:49:47'),
(481, 80, NULL, 11, 1, '2021-09-10 04:56:51'),
(488, 85, NULL, 11, 1, '2021-09-10 04:52:35'),
(502, 80, NULL, 9, 1, '2021-09-10 05:00:26'),
(543, 80, NULL, 13, 1, '2021-09-10 05:38:17'),
(544, 86, NULL, 13, 1, '2021-09-10 05:18:57'),
(575, 116, 2, 13, 1, '2021-09-26 23:18:16'),
(577, 87, 2, 15, 1, '2021-09-13 04:37:15'),
(584, 94, NULL, 13, 1, '2021-09-14 03:15:52'),
(600, 151, 2, 10, 1, '2021-10-18 05:15:08'),
(602, 92, 2, 12, 1, '2021-09-14 03:34:53'),
(603, 95, NULL, 14, 1, '2021-09-20 22:47:02'),
(604, 95, NULL, 13, 1, '2021-09-20 22:48:58'),
(605, 95, NULL, 12, 1, '2021-09-20 22:44:23'),
(607, 95, NULL, 8, 1, '2021-09-20 22:44:35'),
(611, 95, NULL, 9, 1, '2021-09-20 22:51:25'),
(612, 151, 2, 14, 1, '2021-10-18 05:45:27'),
(615, 98, NULL, 14, 1, '2021-09-21 00:50:21'),
(616, 98, NULL, 7, 1, '2021-09-21 00:49:55'),
(617, 98, NULL, 15, 1, '2021-09-21 00:49:59'),
(619, 98, NULL, 13, 1, '2021-09-21 00:54:30'),
(622, 108, 2, 9, 1, '2021-09-23 04:16:50'),
(623, 110, NULL, 13, 1, '2021-09-23 18:05:40'),
(624, 113, NULL, 13, 1, '2021-09-24 03:56:02'),
(625, 113, NULL, 15, 1, '2021-09-24 03:58:00'),
(630, 123, NULL, 10, 1, '2021-10-07 18:47:37'),
(633, 129, NULL, 14, 1, '2021-10-10 22:25:46'),
(634, 129, NULL, 7, 1, '2021-10-10 22:28:25'),
(635, 132, NULL, 11, 1, '2021-10-11 00:54:28'),
(636, 132, NULL, 7, 1, '2021-10-11 00:52:19'),
(637, 132, NULL, 15, 1, '2021-10-11 00:52:21'),
(642, 132, NULL, 8, 1, '2021-10-11 00:52:13'),
(645, 132, NULL, 10, 1, '2021-10-11 00:54:02'),
(646, 132, NULL, 14, 1, '2021-10-11 00:52:19'),
(648, 132, NULL, 13, 1, '2021-10-11 00:54:34'),
(656, 132, NULL, 12, 1, '2021-10-11 00:52:15'),
(658, 132, NULL, 9, 1, '2021-10-11 00:52:17'),
(694, 134, NULL, 13, 1, '2021-10-11 00:52:56'),
(698, 135, NULL, 13, 1, '2021-10-11 00:53:12'),
(705, 136, NULL, 11, 1, '2021-10-11 00:54:17'),
(710, 137, NULL, 15, 1, '2021-10-11 04:37:37'),
(711, 137, NULL, 13, 1, '2021-10-11 04:30:10'),
(712, 137, NULL, 12, 1, '2021-10-11 04:19:26'),
(713, 137, NULL, 14, 1, '2021-10-11 04:31:12'),
(714, 137, NULL, 8, 1, '2021-10-11 04:19:06'),
(722, 137, NULL, 7, 1, '2021-10-11 04:38:51'),
(723, 137, NULL, 9, 1, '2021-10-11 04:26:26'),
(725, 137, NULL, 11, 1, '2021-10-11 04:26:22'),
(727, 137, NULL, 10, 1, '2021-10-11 04:39:01'),
(731, 139, NULL, 13, 1, '2021-10-11 04:30:15'),
(736, 140, NULL, 15, 1, '2021-10-11 04:33:53'),
(740, 141, NULL, 15, 1, '2021-10-11 04:34:12'),
(753, 142, NULL, 11, 1, '2021-10-11 18:57:48'),
(754, 143, NULL, 14, 1, '2021-10-12 05:57:49'),
(755, 145, NULL, 15, 1, '2021-10-14 06:57:05'),
(756, 146, NULL, 15, 1, '2021-10-17 23:24:03'),
(757, 146, NULL, 7, 1, '2021-10-18 00:17:22'),
(762, 147, NULL, 7, 1, '2021-10-17 23:59:32'),
(768, 146, NULL, 13, 1, '2021-10-18 01:23:56'),
(774, 148, NULL, 13, 1, '2021-10-18 00:26:18'),
(824, 149, NULL, 13, 1, '2021-10-18 01:08:25'),
(844, 150, 2, 11, 1, '2021-10-18 05:05:19'),
(851, 152, NULL, 14, 1, '2021-10-18 05:14:40'),
(874, 153, NULL, 7, 1, '2021-10-19 22:45:26'),
(875, 154, NULL, 7, 1, '2021-10-19 22:04:26'),
(918, 155, NULL, 7, 1, '2021-10-19 22:33:15'),
(926, 153, NULL, 11, 1, '2021-10-19 23:22:57'),
(941, 156, NULL, 11, 1, '2021-10-19 23:01:46'),
(956, 157, NULL, 11, 1, '2021-10-20 04:07:50'),
(957, 158, NULL, 11, 1, '2021-10-20 05:24:39'),
(960, 159, NULL, 11, 1, '2021-10-20 05:19:35'),
(963, 158, NULL, 13, 1, '2021-10-20 05:37:32'),
(965, 160, NULL, 13, 1, '2021-10-20 05:29:28'),
(982, 158, NULL, 7, 1, '2021-10-20 05:37:51'),
(983, 165, NULL, 14, 1, '2021-11-18 05:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Review create date',
  `entity_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity id',
  `entity_pk_value` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product id',
  `status_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Status code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';

-- --------------------------------------------------------

--
-- Table structure for table `review_detail`
--

CREATE TABLE `review_detail` (
  `detail_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review detail id',
  `review_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Review id',
  `store_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';

-- --------------------------------------------------------

--
-- Table structure for table `review_entity`
--

CREATE TABLE `review_entity` (
  `entity_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review entities';

--
-- Dumping data for table `review_entity`
--

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `review_entity_summary`
--

CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Summarized rating',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';

-- --------------------------------------------------------

--
-- Table structure for table `review_status`
--

CREATE TABLE `review_status` (
  `status_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review statuses';

--
-- Dumping data for table `review_status`
--

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `review_store`
--

CREATE TABLE `review_store` (
  `review_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule`
--

CREATE TABLE `salesrule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `uses_per_customer` int(11) NOT NULL DEFAULT 0 COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `conditions_serialized` mediumtext DEFAULT NULL COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext DEFAULT NULL COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Advanced',
  `product_ids` text DEFAULT NULL COMMENT 'Product Ids',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) UNSIGNED NOT NULL COMMENT 'Discount Step',
  `simple_free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Simple Free Shipping',
  `apply_to_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Apply To Shipping',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Is Rss',
  `coupon_type` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0 COMMENT 'Uses Per Coupon'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';

--
-- Dumping data for table `salesrule`
--

INSERT INTO `salesrule` (`rule_id`, `name`, `description`, `from_date`, `to_date`, `uses_per_customer`, `is_active`, `conditions_serialized`, `actions_serialized`, `stop_rules_processing`, `is_advanced`, `product_ids`, `sort_order`, `simple_action`, `discount_amount`, `discount_qty`, `discount_step`, `simple_free_shipping`, `apply_to_shipping`, `times_used`, `is_rss`, `coupon_type`, `use_auto_generation`, `uses_per_coupon`) VALUES
(1, 'asd', NULL, NULL, NULL, 0, 1, 'a:7:{s:4:\"type\";s:32:\"salesrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";s:10:\"conditions\";a:1:{i:0;a:5:{s:4:\"type\";s:32:\"salesrule/rule_condition_address\";s:9:\"attribute\";s:13:\"base_subtotal\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"2500\";s:18:\"is_value_processed\";b:0;}}}', 'a:6:{s:4:\"type\";s:40:\"salesrule/rule_condition_product_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";}', 0, 1, NULL, 0, 'by_percent', '20.0000', NULL, 0, 0, 0, 1, 1, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon`
--

CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT 'Coupon Id',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) UNSIGNED DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) UNSIGNED DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT 0 COMMENT 'Coupon Code Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';

--
-- Dumping data for table `salesrule_coupon`
--

INSERT INTO `salesrule_coupon` (`coupon_id`, `rule_id`, `code`, `usage_limit`, `usage_per_customer`, `times_used`, `expiration_date`, `is_primary`, `created_at`, `type`) VALUES
(1, 1, 'xccx', NULL, NULL, 1, NULL, 1, '2021-09-09 07:02:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_usage`
--

CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Times Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

--
-- Dumping data for table `salesrule_coupon_usage`
--

INSERT INTO `salesrule_coupon_usage` (`coupon_id`, `customer_id`, `times_used`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer`
--

CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Customer Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rule Id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer Id',
  `times_used` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Times Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';

--
-- Dumping data for table `salesrule_customer`
--

INSERT INTO `salesrule_customer` (`rule_customer_id`, `rule_id`, `customer_id`, `times_used`) VALUES
(1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer_group`
--

CREATE TABLE `salesrule_customer_group` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

--
-- Dumping data for table `salesrule_customer_group`
--

INSERT INTO `salesrule_customer_group` (`rule_id`, `customer_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_label`
--

CREATE TABLE `salesrule_label` (
  `label_id` int(10) UNSIGNED NOT NULL COMMENT 'Label Id',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_product_attribute`
--

CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_website`
--

CREATE TABLE `salesrule_website` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

--
-- Dumping data for table `salesrule_website`
--

INSERT INTO `salesrule_website` (`rule_id`, `website_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';

-- --------------------------------------------------------

--
-- Table structure for table `sales_billing_agreement`
--

CREATE TABLE `sales_billing_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';

-- --------------------------------------------------------

--
-- Table structure for table `sales_billing_agreement_order`
--

CREATE TABLE `sales_billing_agreement_order` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo`
--

CREATE TABLE `sales_flat_creditmemo` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo_comment`
--

CREATE TABLE `sales_flat_creditmemo_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo_grid`
--

CREATE TABLE `sales_flat_creditmemo_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_creditmemo_item`
--

CREATE TABLE `sales_flat_creditmemo_item` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `description` text DEFAULT NULL COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice`
--

CREATE TABLE `sales_flat_invoice` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `can_void_flag` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';

--
-- Dumping data for table `sales_flat_invoice`
--

INSERT INTO `sales_flat_invoice` (`entity_id`, `store_id`, `base_grand_total`, `shipping_tax_amount`, `tax_amount`, `base_tax_amount`, `store_to_order_rate`, `base_shipping_tax_amount`, `base_discount_amount`, `base_to_order_rate`, `grand_total`, `shipping_amount`, `subtotal_incl_tax`, `base_subtotal_incl_tax`, `store_to_base_rate`, `base_shipping_amount`, `total_qty`, `base_to_global_rate`, `subtotal`, `base_subtotal`, `discount_amount`, `billing_address_id`, `is_used_for_refund`, `order_id`, `email_sent`, `can_void_flag`, `state`, `shipping_address_id`, `store_currency_code`, `transaction_id`, `order_currency_code`, `base_currency_code`, `global_currency_code`, `increment_id`, `created_at`, `updated_at`, `hidden_tax_amount`, `base_hidden_tax_amount`, `shipping_hidden_tax_amount`, `base_shipping_hidden_tax_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `base_total_refunded`, `discount_description`) VALUES
(1, 1, '234.0000', '0.0000', '0.0000', '0.0000', '1.0000', '0.0000', '0.0000', '1.0000', '234.0000', '0.0000', '234.0000', '234.0000', '1.0000', '0.0000', '1.0000', '1.0000', '234.0000', '234.0000', '0.0000', 1, NULL, 1, 1, 0, 2, NULL, 'PHP', NULL, 'PHP', 'PHP', 'PHP', '100000001', '2021-08-01 22:18:38', '2021-08-01 22:18:38', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL),
(2, 1, '2516.3500', '0.0000', '0.0000', '0.0000', '1.0000', '0.0000', '-629.0900', '1.0000', '2516.3500', '0.0000', '3145.4400', '3145.4400', '1.0000', '0.0000', '4.0000', '1.0000', '3145.4400', '3145.4400', '-629.0900', 3, NULL, 3, NULL, 0, 2, NULL, 'PHP', NULL, 'PHP', 'PHP', 'PHP', '100000002', '2021-09-09 04:23:49', '2021-09-09 04:23:49', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, 'xccx');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice_comment`
--

CREATE TABLE `sales_flat_invoice_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';

--
-- Dumping data for table `sales_flat_invoice_comment`
--

INSERT INTO `sales_flat_invoice_comment` (`entity_id`, `parent_id`, `is_customer_notified`, `is_visible_on_front`, `comment`, `created_at`) VALUES
(1, 1, 0, 0, 'Hello', '2021-08-01 22:18:38'),
(2, 2, 0, 0, 'TYY', '2021-09-09 04:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice_grid`
--

CREATE TABLE `sales_flat_invoice_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

--
-- Dumping data for table `sales_flat_invoice_grid`
--

INSERT INTO `sales_flat_invoice_grid` (`entity_id`, `store_id`, `base_grand_total`, `grand_total`, `order_id`, `state`, `store_currency_code`, `order_currency_code`, `base_currency_code`, `global_currency_code`, `increment_id`, `order_increment_id`, `created_at`, `order_created_at`, `billing_name`) VALUES
(1, 1, '234.0000', '234.0000', 1, 2, 'PHP', 'PHP', 'PHP', 'PHP', '100000001', '100000001', '2021-08-01 22:18:38', '2021-08-01 22:16:29', 'df df df'),
(2, 1, '2516.3500', '2516.3500', 3, 2, 'PHP', 'PHP', 'PHP', 'PHP', '100000002', '100000003', '2021-09-09 04:23:49', '2021-09-09 04:21:16', 'admin  Magento');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_invoice_item`
--

CREATE TABLE `sales_flat_invoice_item` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `description` text DEFAULT NULL COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';

--
-- Dumping data for table `sales_flat_invoice_item`
--

INSERT INTO `sales_flat_invoice_item` (`entity_id`, `parent_id`, `base_price`, `tax_amount`, `base_row_total`, `discount_amount`, `row_total`, `base_discount_amount`, `price_incl_tax`, `base_tax_amount`, `base_price_incl_tax`, `qty`, `base_cost`, `price`, `base_row_total_incl_tax`, `row_total_incl_tax`, `product_id`, `order_item_id`, `additional_data`, `description`, `sku`, `name`, `hidden_tax_amount`, `base_hidden_tax_amount`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_applied`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1, 1, '234.0000', '0.0000', '234.0000', NULL, '234.0000', NULL, '234.0000', '0.0000', '234.0000', '1.0000', NULL, '234.0000', '234.0000', '234.0000', 5, 1, NULL, NULL, '546', 'Steam', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000'),
(2, 2, '700.0000', '0.0000', '2100.0000', '420.0000', '2100.0000', '420.0000', '700.0000', '0.0000', '700.0000', '3.0000', NULL, '700.0000', '2100.0000', '2100.0000', 6, 3, NULL, NULL, '123', 'Minecraft WIndows 10', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000'),
(3, 2, '1045.4400', '0.0000', '1045.4400', '209.0900', '1045.4400', '209.0900', '1045.4400', '0.0000', '1045.4400', '1.0000', NULL, '1045.4400', '1045.4400', '1045.4400', 7, 4, NULL, NULL, '12345', 'Days Gone', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order`
--

CREATE TABLE `sales_flat_order` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `forced_shipment_with_invoice` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(255) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(255) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(255) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(255) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(255) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(255) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text DEFAULT NULL COMMENT 'Customer Note',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `total_item_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT 0 COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';

--
-- Dumping data for table `sales_flat_order`
--

INSERT INTO `sales_flat_order` (`entity_id`, `state`, `status`, `coupon_code`, `protect_code`, `shipping_description`, `is_virtual`, `store_id`, `customer_id`, `base_discount_amount`, `base_discount_canceled`, `base_discount_invoiced`, `base_discount_refunded`, `base_grand_total`, `base_shipping_amount`, `base_shipping_canceled`, `base_shipping_invoiced`, `base_shipping_refunded`, `base_shipping_tax_amount`, `base_shipping_tax_refunded`, `base_subtotal`, `base_subtotal_canceled`, `base_subtotal_invoiced`, `base_subtotal_refunded`, `base_tax_amount`, `base_tax_canceled`, `base_tax_invoiced`, `base_tax_refunded`, `base_to_global_rate`, `base_to_order_rate`, `base_total_canceled`, `base_total_invoiced`, `base_total_invoiced_cost`, `base_total_offline_refunded`, `base_total_online_refunded`, `base_total_paid`, `base_total_qty_ordered`, `base_total_refunded`, `discount_amount`, `discount_canceled`, `discount_invoiced`, `discount_refunded`, `grand_total`, `shipping_amount`, `shipping_canceled`, `shipping_invoiced`, `shipping_refunded`, `shipping_tax_amount`, `shipping_tax_refunded`, `store_to_base_rate`, `store_to_order_rate`, `subtotal`, `subtotal_canceled`, `subtotal_invoiced`, `subtotal_refunded`, `tax_amount`, `tax_canceled`, `tax_invoiced`, `tax_refunded`, `total_canceled`, `total_invoiced`, `total_offline_refunded`, `total_online_refunded`, `total_paid`, `total_qty_ordered`, `total_refunded`, `can_ship_partially`, `can_ship_partially_item`, `customer_is_guest`, `customer_note_notify`, `billing_address_id`, `customer_group_id`, `edit_increment`, `email_sent`, `forced_shipment_with_invoice`, `payment_auth_expiration`, `quote_address_id`, `quote_id`, `shipping_address_id`, `adjustment_negative`, `adjustment_positive`, `base_adjustment_negative`, `base_adjustment_positive`, `base_shipping_discount_amount`, `base_subtotal_incl_tax`, `base_total_due`, `payment_authorization_amount`, `shipping_discount_amount`, `subtotal_incl_tax`, `total_due`, `weight`, `customer_dob`, `increment_id`, `applied_rule_ids`, `base_currency_code`, `customer_email`, `customer_firstname`, `customer_lastname`, `customer_middlename`, `customer_prefix`, `customer_suffix`, `customer_taxvat`, `discount_description`, `ext_customer_id`, `ext_order_id`, `global_currency_code`, `hold_before_state`, `hold_before_status`, `order_currency_code`, `original_increment_id`, `relation_child_id`, `relation_child_real_id`, `relation_parent_id`, `relation_parent_real_id`, `remote_ip`, `shipping_method`, `store_currency_code`, `store_name`, `x_forwarded_for`, `customer_note`, `created_at`, `updated_at`, `total_item_count`, `customer_gender`, `hidden_tax_amount`, `base_hidden_tax_amount`, `shipping_hidden_tax_amount`, `base_shipping_hidden_tax_amnt`, `hidden_tax_invoiced`, `base_hidden_tax_invoiced`, `hidden_tax_refunded`, `base_hidden_tax_refunded`, `shipping_incl_tax`, `base_shipping_incl_tax`, `coupon_rule_name`, `paypal_ipn_customer_notified`, `gift_message_id`) VALUES
(1, 'complete', 'complete', NULL, 'b8ae8e', NULL, 1, 1, NULL, '0.0000', NULL, '0.0000', NULL, '234.0000', '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '234.0000', NULL, '234.0000', NULL, '0.0000', NULL, '0.0000', NULL, '1.0000', '1.0000', NULL, '234.0000', '0.0000', NULL, NULL, '234.0000', NULL, NULL, '0.0000', NULL, '0.0000', NULL, '234.0000', '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '1.0000', '1.0000', '234.0000', NULL, '234.0000', NULL, '0.0000', NULL, '0.0000', NULL, NULL, '234.0000', NULL, NULL, '234.0000', '1.0000', NULL, NULL, NULL, 1, 1, 1, 0, NULL, 1, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, '0.0000', '234.0000', '0.0000', NULL, '0.0000', '234.0000', '0.0000', '0.0000', NULL, '100000001', NULL, 'PHP', 'ivargasrodel@gmail.com', 'df', 'df', 'df', NULL, NULL, NULL, NULL, NULL, NULL, 'PHP', NULL, NULL, 'PHP', NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, 'PHP', 'Main Website\nMain Website Store\nDefault Store View', NULL, NULL, '2021-08-01 22:16:29', '2021-08-01 22:18:38', 1, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', '0.0000', NULL, 0, NULL),
(2, 'new', 'pending', NULL, '331263', NULL, 1, 1, 2, '0.0000', NULL, NULL, NULL, '700.0000', '0.0000', NULL, NULL, NULL, '0.0000', NULL, '700.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, '1.0000', '1.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, '700.0000', '0.0000', NULL, NULL, NULL, '0.0000', NULL, '1.0000', '1.0000', '700.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.0000', NULL, NULL, NULL, 0, 1, 2, 1, NULL, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, '0.0000', '700.0000', NULL, NULL, '0.0000', '700.0000', NULL, '0.0000', NULL, '100000002', NULL, 'PHP', 'Ivrgs@gmail.com', 'admin', 'Magento', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PHP', NULL, NULL, 'PHP', NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, 'PHP', 'Main Website\nMain Website Store\nDefault Store View', NULL, NULL, '2021-08-16 03:31:42', '2021-08-16 03:31:42', 1, NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, NULL),
(3, 'complete', 'complete', 'xccx', '72abfc', NULL, 1, 1, 2, '-629.0900', NULL, '-629.0900', NULL, '2516.3500', '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '3145.4400', NULL, '3145.4400', NULL, '0.0000', NULL, '0.0000', NULL, '1.0000', '1.0000', NULL, '2516.3500', '0.0000', NULL, NULL, '2516.3500', NULL, NULL, '-629.0900', NULL, '-629.0900', NULL, '2516.3500', '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '1.0000', '1.0000', '3145.4400', NULL, '3145.4400', NULL, '0.0000', NULL, '0.0000', NULL, NULL, '2516.3500', NULL, NULL, '2516.3500', '4.0000', NULL, NULL, NULL, 0, 0, 3, 1, NULL, 1, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, '0.0000', '3145.4400', '0.0000', NULL, '0.0000', '3145.4400', '0.0000', '0.0000', NULL, '100000003', '1', 'PHP', 'Ivrgs@gmail.com', 'admin', 'Magento', NULL, NULL, NULL, NULL, 'xccx', NULL, NULL, 'PHP', NULL, NULL, 'PHP', NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, 'PHP', 'Main Website\nMain Website Store\nDefault Store View', NULL, NULL, '2021-09-09 04:21:16', '2021-09-09 04:23:49', 2, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', '0.0000', 'asd', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_address`
--

CREATE TABLE `sales_flat_order_address` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text DEFAULT NULL COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text DEFAULT NULL COMMENT 'Vat Request Id',
  `vat_request_date` text DEFAULT NULL COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';

--
-- Dumping data for table `sales_flat_order_address`
--

INSERT INTO `sales_flat_order_address` (`entity_id`, `parent_id`, `customer_address_id`, `quote_address_id`, `region_id`, `customer_id`, `fax`, `region`, `postcode`, `lastname`, `street`, `city`, `email`, `telephone`, `country_id`, `firstname`, `address_type`, `prefix`, `middlename`, `suffix`, `company`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1116', 'df', '23\neas', 'sad', 'ivargasrodel@gmail.com', '123123', 'PH', 'df', 'billing', NULL, 'df', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, 2, NULL, NULL, 'N/A', 'Magento', 'N/A', 'N/A', 'Ivrgs@gmail.com', 'N/A', 'PH', 'admin', 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, NULL, NULL, 2, NULL, NULL, 'N/A', 'Magento', 'N/A', 'N/A', 'Ivrgs@gmail.com', 'N/A', 'PH', 'admin', 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_grid`
--

CREATE TABLE `sales_flat_order_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

--
-- Dumping data for table `sales_flat_order_grid`
--

INSERT INTO `sales_flat_order_grid` (`entity_id`, `status`, `store_id`, `store_name`, `customer_id`, `base_grand_total`, `base_total_paid`, `grand_total`, `total_paid`, `increment_id`, `base_currency_code`, `order_currency_code`, `shipping_name`, `billing_name`, `created_at`, `updated_at`) VALUES
(1, 'complete', 1, 'Main Website\nMain Website Store\nDefault Store View', NULL, '234.0000', '234.0000', '234.0000', '234.0000', '100000001', 'PHP', 'PHP', '  ', 'df df df', '2021-08-01 22:16:29', '2021-08-01 22:18:38'),
(2, 'pending', 1, 'Main Website\nMain Website Store\nDefault Store View', 2, '700.0000', NULL, '700.0000', NULL, '100000002', 'PHP', 'PHP', '  ', 'admin  Magento', '2021-08-16 03:31:42', '2021-08-16 03:31:42'),
(3, 'complete', 1, 'Main Website\nMain Website Store\nDefault Store View', 2, '2516.3500', '2516.3500', '2516.3500', '2516.3500', '100000003', 'PHP', 'PHP', '  ', 'admin  Magento', '2021-09-09 04:21:16', '2021-09-09 04:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_item`
--

CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Order Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text DEFAULT NULL COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Weight',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `applied_rule_ids` text DEFAULT NULL COMMENT 'Applied Rule Ids',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT 0.0000 COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT 0.0000 COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `is_nominal` int(11) NOT NULL DEFAULT 0 COMMENT 'Is Nominal',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';

--
-- Dumping data for table `sales_flat_order_item`
--

INSERT INTO `sales_flat_order_item` (`item_id`, `order_id`, `parent_item_id`, `quote_item_id`, `store_id`, `created_at`, `updated_at`, `product_id`, `product_type`, `product_options`, `weight`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `free_shipping`, `is_qty_decimal`, `no_discount`, `qty_backordered`, `qty_canceled`, `qty_invoiced`, `qty_ordered`, `qty_refunded`, `qty_shipped`, `base_cost`, `price`, `base_price`, `original_price`, `base_original_price`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_invoiced`, `base_tax_invoiced`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `amount_refunded`, `base_amount_refunded`, `row_total`, `base_row_total`, `row_invoiced`, `base_row_invoiced`, `row_weight`, `base_tax_before_discount`, `tax_before_discount`, `ext_order_item_id`, `locked_do_invoice`, `locked_do_ship`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `hidden_tax_invoiced`, `base_hidden_tax_invoiced`, `hidden_tax_refunded`, `base_hidden_tax_refunded`, `is_nominal`, `tax_canceled`, `hidden_tax_canceled`, `tax_refunded`, `base_tax_refunded`, `discount_refunded`, `base_discount_refunded`, `gift_message_id`, `gift_message_available`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_applied`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1, 1, NULL, 4, 1, '2021-08-01 22:16:29', '2021-08-01 22:18:38', 5, 'virtual', 'a:1:{s:15:\"info_buyRequest\";a:5:{s:4:\"uenc\";s:100:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS9pbmRleC5waHAvc3RlYW0uaHRtbD9fX19TSUQ9VQ,,\";s:7:\"product\";s:1:\"5\";s:8:\"form_key\";s:16:\"W9bdXfCXxokfCE9A\";s:15:\"related_product\";s:0:\"\";s:3:\"qty\";s:1:\"1\";}}', NULL, 1, '546', 'Steam', NULL, NULL, NULL, 0, 0, 0, NULL, '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', NULL, '234.0000', '234.0000', '234.0000', '234.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '234.0000', '234.0000', '234.0000', '234.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '234.0000', '234.0000', '234.0000', '234.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000'),
(2, 2, NULL, 7, 1, '2021-08-16 03:31:42', '2021-08-16 03:31:42', 6, 'virtual', 'a:1:{s:15:\"info_buyRequest\";a:5:{s:4:\"uenc\";s:104:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS9taW5lY3JhZnQtd2luZG93cy0xMC5odG1sP19fX1NJRD1V\";s:7:\"product\";s:1:\"6\";s:8:\"form_key\";s:16:\"U6UsYp3DdfFB7gMG\";s:15:\"related_product\";s:0:\"\";s:3:\"qty\";s:1:\"1\";}}', NULL, 1, '123', 'Minecraft WIndows 10', NULL, NULL, NULL, 0, 0, 0, NULL, '0.0000', '0.0000', '1.0000', '0.0000', '0.0000', NULL, '700.0000', '700.0000', '700.0000', '700.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '700.0000', '700.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '700.0000', '700.0000', '700.0000', '700.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000'),
(3, 3, NULL, 8, 1, '2021-09-09 04:21:16', '2021-09-09 04:23:49', 6, 'virtual', 'a:1:{s:15:\"info_buyRequest\";a:4:{s:4:\"uenc\";s:60:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS8,\";s:7:\"product\";s:1:\"6\";s:8:\"form_key\";s:16:\"3ripiHqIwbVDGEjA\";s:3:\"qty\";d:1;}}', NULL, 1, '123', 'Minecraft WIndows 10', NULL, '1', NULL, 0, 0, 0, NULL, '0.0000', '3.0000', '3.0000', '0.0000', '0.0000', NULL, '700.0000', '700.0000', '700.0000', '700.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '20.0000', '420.0000', '420.0000', '420.0000', '420.0000', '0.0000', '0.0000', '2100.0000', '2100.0000', '2100.0000', '2100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '700.0000', '700.0000', '2100.0000', '2100.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000'),
(4, 3, NULL, 10, 1, '2021-09-09 04:21:16', '2021-09-09 04:23:49', 7, 'downloadable', 'a:4:{s:15:\"info_buyRequest\";a:6:{s:4:\"uenc\";s:80:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS9kYXlzLWdvbmUuaHRtbA,,\";s:7:\"product\";s:1:\"7\";s:8:\"form_key\";s:16:\"oSXsbL2m9y2ojQcJ\";s:15:\"related_product\";s:0:\"\";s:5:\"links\";a:1:{i:0;s:1:\"1\";}s:3:\"qty\";s:1:\"1\";}s:5:\"links\";a:1:{i:0;s:1:\"1\";}s:15:\"is_downloadable\";b:1;s:17:\"real_product_type\";s:12:\"downloadable\";}', NULL, 1, '12345', 'Days Gone', NULL, '1', NULL, 0, 0, 0, NULL, '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', NULL, '1045.4400', '1045.4400', '1045.4400', '1045.4400', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '20.0000', '209.0900', '209.0900', '209.0900', '209.0900', '0.0000', '0.0000', '1045.4400', '1045.4400', '1045.4400', '1045.4400', '0.0000', NULL, NULL, NULL, NULL, NULL, '1045.4400', '1045.4400', '1045.4400', '1045.4400', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_payment`
--

CREATE TABLE `sales_flat_order_payment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(255) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(255) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(255) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_status_description` varchar(255) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(255) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(255) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(255) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(255) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(255) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(255) DEFAULT NULL COMMENT 'Cc Trans Id',
  `paybox_request_number` varchar(255) DEFAULT NULL COMMENT 'Paybox Request Number',
  `address_status` varchar(255) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text DEFAULT NULL COMMENT 'Additional Information'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';

--
-- Dumping data for table `sales_flat_order_payment`
--

INSERT INTO `sales_flat_order_payment` (`entity_id`, `parent_id`, `base_shipping_captured`, `shipping_captured`, `amount_refunded`, `base_amount_paid`, `amount_canceled`, `base_amount_authorized`, `base_amount_paid_online`, `base_amount_refunded_online`, `base_shipping_amount`, `shipping_amount`, `amount_paid`, `amount_authorized`, `base_amount_ordered`, `base_shipping_refunded`, `shipping_refunded`, `base_amount_refunded`, `amount_ordered`, `base_amount_canceled`, `quote_payment_id`, `additional_data`, `cc_exp_month`, `cc_ss_start_year`, `echeck_bank_name`, `method`, `cc_debug_request_body`, `cc_secure_verify`, `protection_eligibility`, `cc_approval`, `cc_last4`, `cc_status_description`, `echeck_type`, `cc_debug_response_serialized`, `cc_ss_start_month`, `echeck_account_type`, `last_trans_id`, `cc_cid_status`, `cc_owner`, `cc_type`, `po_number`, `cc_exp_year`, `cc_status`, `echeck_routing_number`, `account_status`, `anet_trans_method`, `cc_debug_response_body`, `cc_ss_issue`, `echeck_account_name`, `cc_avs_status`, `cc_number_enc`, `cc_trans_id`, `paybox_request_number`, `address_status`, `additional_information`) VALUES
(1, 1, '0.0000', '0.0000', NULL, '234.0000', NULL, NULL, NULL, NULL, '0.0000', '0.0000', '234.0000', NULL, '234.0000', NULL, NULL, NULL, '234.0000', NULL, NULL, NULL, '0', '0', NULL, 'checkmo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, '700.0000', NULL, NULL, NULL, '700.0000', NULL, NULL, NULL, '0', '0', NULL, 'checkmo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, '0.0000', '0.0000', NULL, '2516.3500', NULL, NULL, NULL, NULL, '0.0000', '0.0000', '2516.3500', NULL, '2516.3500', NULL, NULL, NULL, '2516.3500', NULL, NULL, NULL, '0', '0', NULL, 'checkmo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_status_history`
--

CREATE TABLE `sales_flat_order_status_history` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';

--
-- Dumping data for table `sales_flat_order_status_history`
--

INSERT INTO `sales_flat_order_status_history` (`entity_id`, `parent_id`, `is_customer_notified`, `is_visible_on_front`, `comment`, `status`, `created_at`, `entity_name`) VALUES
(1, 1, 1, 0, NULL, 'pending', '2021-08-01 22:16:29', 'order'),
(2, 1, 1, 0, NULL, 'complete', '2021-08-01 22:18:38', 'invoice'),
(3, 2, 1, 0, NULL, 'pending', '2021-08-16 03:31:42', 'order'),
(4, 3, 1, 0, NULL, 'pending', '2021-09-09 04:21:16', 'order'),
(5, 3, 1, 0, 'TY', 'pending', '2021-09-09 04:22:57', 'order'),
(6, 3, 0, 0, NULL, 'complete', '2021-09-09 04:23:49', 'invoice');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote`
--

CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) UNSIGNED DEFAULT 1 COMMENT 'Is Active',
  `is_virtual` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Is Multi Shipping',
  `items_count` int(10) UNSIGNED DEFAULT 0 COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT 0.0000 COMMENT 'Items Qty',
  `orig_order_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT 0.0000 COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT 0.0000 COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT 0.0000 COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) UNSIGNED DEFAULT 0 COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT 1 COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Customer Is Guest',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) UNSIGNED DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Trigger Recollect',
  `ext_shipping_info` text DEFAULT NULL COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Is Quote Persistent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';

--
-- Dumping data for table `sales_flat_quote`
--

INSERT INTO `sales_flat_quote` (`entity_id`, `store_id`, `created_at`, `updated_at`, `converted_at`, `is_active`, `is_virtual`, `is_multi_shipping`, `items_count`, `items_qty`, `orig_order_id`, `store_to_base_rate`, `store_to_quote_rate`, `base_currency_code`, `store_currency_code`, `quote_currency_code`, `grand_total`, `base_grand_total`, `checkout_method`, `customer_id`, `customer_tax_class_id`, `customer_group_id`, `customer_email`, `customer_prefix`, `customer_firstname`, `customer_middlename`, `customer_lastname`, `customer_suffix`, `customer_dob`, `customer_note`, `customer_note_notify`, `customer_is_guest`, `remote_ip`, `applied_rule_ids`, `reserved_order_id`, `password_hash`, `coupon_code`, `global_currency_code`, `base_to_global_rate`, `base_to_quote_rate`, `customer_taxvat`, `customer_gender`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `is_changed`, `trigger_recollect`, `ext_shipping_info`, `gift_message_id`, `is_persistent`) VALUES
(1, 1, '2021-07-29 07:03:53', '2021-07-29 07:03:53', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '0.0000', '0.0000', NULL, 1, 3, 1, 'test@gmail.com', NULL, 'Test', 'test', 'test', NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0),
(2, 1, '2021-07-29 19:53:56', '2021-07-29 20:11:52', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '250.0000', '250.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '250.0000', '250.0000', '250.0000', '250.0000', 1, 0, NULL, NULL, 0),
(3, 1, '2021-07-29 22:34:50', '2021-08-16 03:32:06', NULL, 0, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '700.0000', '700.0000', NULL, 2, 3, 1, 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, '100000002', NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '700.0000', '700.0000', '700.0000', '700.0000', 1, 0, NULL, NULL, 0),
(4, 1, '2021-08-01 20:46:45', '2021-08-01 22:16:29', NULL, 0, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '234.0000', '234.0000', 'guest', NULL, 3, 0, 'ivargasrodel@gmail.com', NULL, 'df', 'df', 'df', NULL, NULL, NULL, 1, 1, '127.0.0.1', NULL, '100000001', NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '234.0000', '234.0000', '234.0000', '234.0000', 1, 0, NULL, NULL, 0),
(5, 1, '2021-08-02 03:17:51', '2021-08-02 03:17:52', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '123.0000', '123.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '123.0000', '123.0000', '123.0000', '123.0000', 1, 0, NULL, NULL, 0),
(7, 1, '2021-08-16 04:26:09', '2021-09-09 04:21:30', NULL, 0, 0, 0, 1, '1.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '2516.3500', '2516.3500', NULL, 2, 3, 1, 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, NULL, 1, 0, '127.0.0.1', '1', '100000003', NULL, 'xccx', 'PHP', '1.0000', '1.0000', NULL, NULL, '3145.4400', '3145.4400', '2516.3500', '2516.3500', 1, 0, NULL, NULL, 0),
(9, 1, '2021-09-09 21:44:43', '2021-09-09 23:02:34', NULL, 1, 0, 0, 2, '2.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '4449.0000', '4449.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '4449.0000', '4449.0000', '4449.0000', '4449.0000', 1, 0, NULL, NULL, 0),
(10, 1, '2021-09-13 04:25:44', '2021-09-23 04:58:35', NULL, 1, 0, 0, 1, '1.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '1340.0000', '1340.0000', NULL, 2, 3, 1, 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '1340.0000', '1340.0000', '1340.0000', '1340.0000', 1, 0, NULL, NULL, 0),
(11, 1, '2021-09-20 22:44:38', '2021-09-20 22:54:24', NULL, 1, 0, 0, 1, '1.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '1580.0000', '1580.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '1580.0000', '1580.0000', '1580.0000', '1580.0000', 1, 0, NULL, NULL, 0),
(14, 1, '2021-10-20 05:37:56', '2021-10-20 05:38:04', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PHP', 'PHP', 'PHP', '0.0000', '0.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'PHP', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_address`
--

CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) UNSIGNED NOT NULL COMMENT 'Address Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT 0 COMMENT 'Save In Address Book',
  `customer_address_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(40) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(255) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Same As Billing',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Free Shipping',
  `collect_shipping_rates` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Grand Total',
  `customer_notes` text DEFAULT NULL COMMENT 'Customer Notes',
  `applied_taxes` text DEFAULT NULL COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text DEFAULT NULL COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text DEFAULT NULL COMMENT 'Vat Request Id',
  `vat_request_date` text DEFAULT NULL COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';

--
-- Dumping data for table `sales_flat_quote_address`
--

INSERT INTO `sales_flat_quote_address` (`address_id`, `quote_id`, `created_at`, `updated_at`, `customer_id`, `save_in_address_book`, `customer_address_id`, `address_type`, `email`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `company`, `street`, `city`, `region`, `region_id`, `postcode`, `country_id`, `telephone`, `fax`, `same_as_billing`, `free_shipping`, `collect_shipping_rates`, `shipping_method`, `shipping_description`, `weight`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `tax_amount`, `base_tax_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `discount_amount`, `base_discount_amount`, `grand_total`, `base_grand_total`, `customer_notes`, `applied_taxes`, `discount_description`, `shipping_discount_amount`, `base_shipping_discount_amount`, `subtotal_incl_tax`, `base_subtotal_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `shipping_hidden_tax_amount`, `base_shipping_hidden_tax_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`, `gift_message_id`) VALUES
(1, 1, '2021-07-29 07:03:53', '2021-07-29 07:03:53', 1, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '2021-07-29 07:03:53', '2021-07-29 07:03:53', 1, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, '2021-07-29 19:53:56', '2021-07-29 20:11:52', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, '2021-07-29 19:53:56', '2021-07-29 20:11:52', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '1.0000', '250.0000', '250.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '250.0000', '250.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '250.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, '2021-07-29 22:34:50', '2021-08-16 03:31:42', 2, 1, 1, 'billing', 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, 'N/A', 'N/A', NULL, NULL, 'N/A', 'PH', 'N/A', NULL, 0, 0, 0, NULL, NULL, '0.0000', '700.0000', '700.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '700.0000', '700.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '700.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 3, '2021-07-29 22:34:50', '2021-08-16 03:31:42', 2, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 4, '2021-08-01 20:46:45', '2021-08-01 22:16:29', NULL, 1, NULL, 'billing', 'ivargasrodel@gmail.com', NULL, 'df', 'df', 'df', NULL, NULL, '23\neas', 'sad', NULL, NULL, '1116', 'PH', '123123', NULL, 0, 0, 0, NULL, NULL, '0.0000', '234.0000', '234.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '234.0000', '234.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '234.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 4, '2021-08-01 20:46:45', '2021-08-01 22:16:29', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 5, '2021-08-02 03:17:51', '2021-08-02 03:17:52', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 5, '2021-08-02 03:17:51', '2021-08-02 03:17:52', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '1.0000', '123.0000', '123.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '123.0000', '123.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '123.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 7, '2021-08-16 04:26:09', '2021-09-09 04:21:16', 2, 0, 1, 'billing', 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, 'N/A', 'N/A', NULL, NULL, 'N/A', 'PH', 'N/A', NULL, 0, 0, 0, NULL, NULL, '0.0000', '3145.4400', '3145.4400', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '-629.0900', '-629.0900', '2516.3500', '2516.3500', NULL, 'a:0:{}', 'xccx', '0.0000', '0.0000', '3145.4400', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 7, '2021-08-16 04:26:09', '2021-09-09 04:21:16', 2, 0, 1, 'shipping', 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, 'N/A', 'N/A', NULL, NULL, 'N/A', 'PH', 'N/A', NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 9, '2021-09-09 21:44:43', '2021-09-09 23:02:35', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '4449.0000', '4449.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '4449.0000', '4449.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '4449.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 9, '2021-09-09 21:44:43', '2021-09-09 23:02:35', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 10, '2021-09-13 04:37:16', '2021-09-23 04:58:35', 2, 0, 1, 'billing', 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, 'N/A', 'N/A', NULL, NULL, 'N/A', 'PH', 'N/A', NULL, 0, 0, 0, NULL, NULL, '0.0000', '1340.0000', '1340.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1340.0000', '1340.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '1340.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 10, '2021-09-13 04:37:16', '2021-09-23 04:58:35', 2, 0, 1, 'shipping', 'Ivrgs@gmail.com', NULL, 'admin', NULL, 'Magento', NULL, NULL, 'N/A', 'N/A', NULL, NULL, 'N/A', 'PH', 'N/A', NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 11, '2021-09-20 22:44:41', '2021-09-20 22:54:24', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '1580.0000', '1580.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1580.0000', '1580.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '1580.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 11, '2021-09-20 22:44:41', '2021-09-20 22:54:24', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 14, '2021-10-20 05:37:57', '2021-10-20 05:38:05', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 14, '2021-10-20 05:37:57', '2021-10-20 05:38:05', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_address_item`
--

CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Address Item Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quote Address Id',
  `quote_item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `applied_rule_ids` text DEFAULT NULL COMMENT 'Applied Rule Ids',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Weight',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `free_shipping` int(10) UNSIGNED DEFAULT NULL COMMENT 'Free Shipping',
  `is_qty_decimal` int(10) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) UNSIGNED DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_item`
--

CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL COMMENT 'Description',
  `applied_rule_ids` text DEFAULT NULL COMMENT 'Applied Rule Ids',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT 0.0000 COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text DEFAULT NULL COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';

--
-- Dumping data for table `sales_flat_quote_item`
--

INSERT INTO `sales_flat_quote_item` (`item_id`, `quote_id`, `created_at`, `updated_at`, `product_id`, `store_id`, `parent_item_id`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `free_shipping`, `is_qty_decimal`, `no_discount`, `weight`, `qty`, `price`, `base_price`, `custom_price`, `discount_percent`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `row_total`, `base_row_total`, `row_total_with_discount`, `row_weight`, `product_type`, `base_tax_before_discount`, `tax_before_discount`, `original_custom_price`, `redirect_url`, `base_cost`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `gift_message_id`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`) VALUES
(10, 7, '2021-09-09 04:20:24', '2021-09-09 04:20:45', 7, 1, NULL, 1, '12345', 'Days Gone', NULL, '1', NULL, 0, 0, 0, NULL, '1.0000', '1045.4400', '1045.4400', NULL, '20.0000', '209.0900', '209.0900', '0.0000', '0.0000', '0.0000', '1045.4400', '1045.4400', '0.0000', '0.0000', 'downloadable', NULL, NULL, NULL, NULL, NULL, '1045.4400', '1045.4400', '1045.4400', '1045.4400', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(16, 9, '2021-09-09 22:58:40', '2021-09-09 22:58:40', 11, 1, NULL, 1, NULL, 'Deus EX Mankind Divided', NULL, NULL, NULL, 0, 0, 0, NULL, '1.0000', '2599.0000', '2599.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2599.0000', '2599.0000', '0.0000', '0.0000', 'downloadable', NULL, NULL, NULL, NULL, NULL, '2599.0000', '2599.0000', '2599.0000', '2599.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(17, 9, '2021-09-09 23:02:34', '2021-09-09 23:02:34', 14, 1, NULL, 1, NULL, 'Tom Clancy\'s Ghost Recon Wildlands', NULL, NULL, NULL, 0, 0, 0, NULL, '1.0000', '1850.0000', '1850.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1850.0000', '1850.0000', '0.0000', '0.0000', 'downloadable', NULL, NULL, NULL, NULL, NULL, '1850.0000', '1850.0000', '1850.0000', '1850.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(22, 11, '2021-09-20 22:53:09', '2021-09-20 22:53:09', 9, 1, NULL, 1, NULL, 'DOOM Eternal', NULL, NULL, NULL, 0, 0, 0, NULL, '1.0000', '1580.0000', '1580.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1580.0000', '1580.0000', '0.0000', '0.0000', 'downloadable', NULL, NULL, NULL, NULL, NULL, '1580.0000', '1580.0000', '1580.0000', '1580.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(26, 10, '2021-09-21 05:43:24', '2021-09-21 05:43:24', 8, 1, NULL, 1, '123', 'Minecraft Bedrock', NULL, NULL, NULL, 0, 0, 0, NULL, '1.0000', '1340.0000', '1340.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1340.0000', '1340.0000', '0.0000', '0.0000', 'downloadable', NULL, NULL, NULL, NULL, NULL, '1340.0000', '1340.0000', '1340.0000', '1340.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_item_option`
--

CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';

--
-- Dumping data for table `sales_flat_quote_item_option`
--

INSERT INTO `sales_flat_quote_item_option` (`option_id`, `item_id`, `product_id`, `code`, `value`) VALUES
(11, 10, 7, 'info_buyRequest', 'a:6:{s:4:\"uenc\";s:80:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS9kYXlzLWdvbmUuaHRtbA,,\";s:7:\"product\";s:1:\"7\";s:8:\"form_key\";s:16:\"oSXsbL2m9y2ojQcJ\";s:15:\"related_product\";s:0:\"\";s:5:\"links\";a:1:{i:0;s:1:\"1\";}s:3:\"qty\";s:1:\"1\";}'),
(12, 10, 7, 'downloadable_link_ids', '1'),
(23, 16, 11, 'info_buyRequest', 'a:4:{s:4:\"uenc\";s:60:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS8,\";s:7:\"product\";s:2:\"11\";s:8:\"form_key\";s:16:\"QLmiBUmhdIswzRdH\";s:3:\"qty\";d:1;}'),
(24, 16, 11, 'downloadable_link_ids', '4'),
(25, 17, 14, 'info_buyRequest', 'a:5:{s:4:\"uenc\";s:112:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS90b20tY2xhbmN5LXMtZ2hvc3QtcmVjb24td2lsZGxhbmRzLmh0bWw,\";s:7:\"product\";s:2:\"14\";s:8:\"form_key\";s:16:\"QLmiBUmhdIswzRdH\";s:15:\"related_product\";s:0:\"\";s:3:\"qty\";s:1:\"1\";}'),
(26, 17, 14, 'downloadable_link_ids', '7'),
(35, 22, 9, 'info_buyRequest', 'a:5:{s:4:\"uenc\";s:84:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS9kb29tLWV0ZXJuYWwuaHRtbA,,\";s:7:\"product\";s:1:\"9\";s:8:\"form_key\";s:16:\"XyzCpbfH2M1M10v5\";s:15:\"related_product\";s:0:\"\";s:3:\"qty\";s:1:\"1\";}'),
(36, 22, 9, 'downloadable_link_ids', '3'),
(43, 26, 8, 'info_buyRequest', 'a:4:{s:4:\"uenc\";s:60:\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvLW1pcnJvci1tYWdlbnRvLTEuOS8,\";s:7:\"product\";s:1:\"8\";s:8:\"form_key\";s:16:\"uzxLxftyafWr0ytm\";s:3:\"qty\";d:1;}'),
(44, 26, 8, 'downloadable_link_ids', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_payment`
--

CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL COMMENT 'Payment Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text DEFAULT NULL COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';

--
-- Dumping data for table `sales_flat_quote_payment`
--

INSERT INTO `sales_flat_quote_payment` (`payment_id`, `quote_id`, `created_at`, `updated_at`, `method`, `cc_type`, `cc_number_enc`, `cc_last4`, `cc_cid_enc`, `cc_owner`, `cc_exp_month`, `cc_exp_year`, `cc_ss_owner`, `cc_ss_start_month`, `cc_ss_start_year`, `po_number`, `additional_data`, `cc_ss_issue`, `additional_information`, `paypal_payer_id`, `paypal_payer_status`, `paypal_correlation_id`) VALUES
(1, 4, '2021-08-01 22:15:50', '2021-08-01 22:16:29', 'checkmo', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, '2021-08-16 03:31:11', '2021-08-16 03:31:42', 'checkmo', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 7, '2021-09-09 04:20:46', '2021-09-09 04:21:16', 'checkmo', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) UNSIGNED NOT NULL COMMENT 'Rate Id',
  `address_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text DEFAULT NULL COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `error_message` text DEFAULT NULL COMMENT 'Error Message',
  `method_title` text DEFAULT NULL COMMENT 'Method Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment`
--

CREATE TABLE `sales_flat_shipment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `packages` text DEFAULT NULL COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob DEFAULT NULL COMMENT 'Shipping Label Content'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_comment`
--

CREATE TABLE `sales_flat_shipment_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_grid`
--

CREATE TABLE `sales_flat_shipment_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_item`
--

CREATE TABLE `sales_flat_shipment_item` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text DEFAULT NULL COMMENT 'Additional Data',
  `description` text DEFAULT NULL COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_shipment_track`
--

CREATE TABLE `sales_flat_shipment_track` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `track_number` text DEFAULT NULL COMMENT 'Number',
  `description` text DEFAULT NULL COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated`
--

CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_created`
--

CREATE TABLE `sales_order_aggregated_created` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_updated`
--

CREATE TABLE `sales_order_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Discount Amount Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status`
--

CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status`
--

INSERT INTO `sales_order_status` (`status`, `label`) VALUES
('canceled', 'Canceled'),
('closed', 'Closed'),
('complete', 'Complete'),
('fraud', 'Suspected Fraud'),
('holded', 'On Hold'),
('payment_review', 'Payment Review'),
('paypal_canceled_reversal', 'PayPal Canceled Reversal'),
('paypal_reversed', 'PayPal Reversed'),
('pending', 'Pending'),
('pending_payment', 'Pending Payment'),
('pending_paypal', 'Pending PayPal'),
('processing', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_label`
--

CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_state`
--

CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status_state`
--

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`) VALUES
('canceled', 'canceled', 1),
('closed', 'closed', 1),
('complete', 'complete', 1),
('fraud', 'payment_review', 0),
('holded', 'holded', 1),
('payment_review', 'payment_review', 1),
('pending', 'new', 1),
('pending_payment', 'pending_payment', 1),
('processing', 'processing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax`
--

CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  `hidden` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax_item`
--

CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Item Id',
  `tax_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_transaction`
--

CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL COMMENT 'Transaction Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Order Id',
  `payment_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Closed',
  `additional_information` blob DEFAULT NULL COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `sales_recurring_profile`
--

CREATE TABLE `sales_recurring_profile` (
  `profile_id` int(10) UNSIGNED NOT NULL COMMENT 'Profile Id',
  `state` varchar(20) NOT NULL COMMENT 'State',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `reference_id` varchar(32) DEFAULT NULL COMMENT 'Reference Id',
  `subscriber_name` varchar(150) DEFAULT NULL COMMENT 'Subscriber Name',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Datetime',
  `internal_reference_id` varchar(42) NOT NULL COMMENT 'Internal Reference Id',
  `schedule_description` varchar(255) NOT NULL COMMENT 'Schedule Description',
  `suspension_threshold` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Suspension Threshold',
  `bill_failed_later` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Bill Failed Later',
  `period_unit` varchar(20) NOT NULL COMMENT 'Period Unit',
  `period_frequency` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Period Frequency',
  `period_max_cycles` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Period Max Cycles',
  `billing_amount` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Billing Amount',
  `trial_period_unit` varchar(20) DEFAULT NULL COMMENT 'Trial Period Unit',
  `trial_period_frequency` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Trial Period Frequency',
  `trial_period_max_cycles` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Trial Period Max Cycles',
  `trial_billing_amount` text DEFAULT NULL COMMENT 'Trial Billing Amount',
  `currency_code` varchar(3) NOT NULL COMMENT 'Currency Code',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `init_amount` decimal(12,4) DEFAULT NULL COMMENT 'Init Amount',
  `init_may_fail` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Init May Fail',
  `order_info` text NOT NULL COMMENT 'Order Info',
  `order_item_info` text NOT NULL COMMENT 'Order Item Info',
  `billing_address_info` text NOT NULL COMMENT 'Billing Address Info',
  `shipping_address_info` text DEFAULT NULL COMMENT 'Shipping Address Info',
  `profile_vendor_info` text DEFAULT NULL COMMENT 'Profile Vendor Info',
  `additional_info` text DEFAULT NULL COMMENT 'Additional Info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile';

-- --------------------------------------------------------

--
-- Table structure for table `sales_recurring_profile_order`
--

CREATE TABLE `sales_recurring_profile_order` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link Id',
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Order Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated`
--

CREATE TABLE `sales_refunded_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated_order`
--

CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated`
--

CREATE TABLE `sales_shipping_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated_order`
--

CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `sendfriend_log`
--

CREATE TABLE `sendfriend_log` (
  `log_id` int(10) UNSIGNED NOT NULL COMMENT 'Log ID',
  `ip` varbinary(16) DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Log time',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';

-- --------------------------------------------------------

--
-- Table structure for table `shipping_tablerate`
--

CREATE TABLE `shipping_tablerate` (
  `pk` int(10) UNSIGNED NOT NULL COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Cost'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';

-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

CREATE TABLE `sitemap` (
  `sitemap_id` int(10) UNSIGNED NOT NULL COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Sitemap';

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'Tag Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Status',
  `first_customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'First Customer Id',
  `first_store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'First Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag';

-- --------------------------------------------------------

--
-- Table structure for table `tag_properties`
--

CREATE TABLE `tag_properties` (
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tag Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `base_popularity` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Base Popularity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Properties';

-- --------------------------------------------------------

--
-- Table structure for table `tag_relation`
--

CREATE TABLE `tag_relation` (
  `tag_relation_id` int(10) UNSIGNED NOT NULL COMMENT 'Tag Relation Id',
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tag Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Store Id',
  `active` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Active',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Relation';

-- --------------------------------------------------------

--
-- Table structure for table `tag_summary`
--

CREATE TABLE `tag_summary` (
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tag Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store Id',
  `customers` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customers',
  `products` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Products',
  `uses` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Uses',
  `historical_uses` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Historical Uses',
  `popularity` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Popularity',
  `base_popularity` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Base Popularity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Summary';

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation`
--

CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';

--
-- Dumping data for table `tax_calculation`
--

INSERT INTO `tax_calculation` (`tax_calculation_id`, `tax_calculation_rate_id`, `tax_calculation_rule_id`, `customer_tax_class_id`, `product_tax_class_id`) VALUES
(1, 1, 1, 3, 2),
(2, 2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate`
--

CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) UNSIGNED DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) UNSIGNED DEFAULT NULL COMMENT 'Zip To'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';

--
-- Dumping data for table `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', '8.2500', NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', '8.3750', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate_title`
--

CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rule`
--

CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';

--
-- Dumping data for table `tax_calculation_rule`
--

INSERT INTO `tax_calculation_rule` (`tax_calculation_rule_id`, `code`, `priority`, `position`, `calculate_subtotal`) VALUES
(1, 'Retail Customer-Taxable Goods-Rate 1', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Class';

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER'),
(4, 'Shipping', 'PRODUCT');

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_created`
--

CREATE TABLE `tax_order_aggregated_created` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_updated`
--

CREATE TABLE `tax_order_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `weee_discount`
--

CREATE TABLE `weee_discount` (
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Discount';

-- --------------------------------------------------------

--
-- Table structure for table `weee_tax`
--

CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000 COMMENT 'Value',
  `state` varchar(255) NOT NULL DEFAULT '*' COMMENT 'State',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE `widget` (
  `widget_id` int(10) UNSIGNED NOT NULL COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text DEFAULT NULL COMMENT 'Parameters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance`
--

CREATE TABLE `widget_instance` (
  `instance_id` int(10) UNSIGNED NOT NULL COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `package_theme` varchar(255) DEFAULT NULL COMMENT 'Package Theme',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text DEFAULT NULL COMMENT 'Widget parameters',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';

--
-- Dumping data for table `widget_instance`
--

INSERT INTO `widget_instance` (`instance_id`, `instance_type`, `package_theme`, `title`, `store_ids`, `widget_parameters`, `sort_order`) VALUES
(6, 'sales/widget_guest_form', 'iTemplate/default', 'my orders', '0', 'a:1:{s:5:\"title\";s:0:\"\";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page`
--

CREATE TABLE `widget_instance_page` (
  `page_id` int(10) UNSIGNED NOT NULL COMMENT 'Page Id',
  `instance_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Block Reference',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text DEFAULT NULL COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page_layout`
--

CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Page Id',
  `layout_update_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Layout Update Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist ID',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Customer ID',
  `shared` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `shared`, `sharing_code`, `updated_at`) VALUES
(1, 2, 0, 'b30a82a6ed4ccc06c48ceb6b5a72ab56', '2021-09-14 03:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Wishlist ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text DEFAULT NULL COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';

--
-- Dumping data for table `wishlist_item`
--

INSERT INTO `wishlist_item` (`wishlist_item_id`, `wishlist_id`, `product_id`, `store_id`, `added_at`, `description`, `qty`) VALUES
(2, 1, 13, 1, '2021-09-14 03:29:04', NULL, '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item_option`
--

CREATE TABLE `wishlist_item_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `wishlist_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';

--
-- Dumping data for table `wishlist_item_option`
--

INSERT INTO `wishlist_item_option` (`option_id`, `wishlist_item_id`, `product_id`, `code`, `value`) VALUES
(2, 2, 13, 'info_buyRequest', 'a:4:{s:7:\"product\";s:2:\"13\";s:8:\"form_key\";s:16:\"sqCGUBfcwx8TbKcx\";s:15:\"related_product\";s:0:\"\";s:3:\"qty\";s:1:\"1\";}'),
(3, 2, 13, 'downloadable_link_ids', '6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminnotification_inbox`
--
ALTER TABLE `adminnotification_inbox`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `IDX_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  ADD KEY `IDX_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  ADD KEY `IDX_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`);

--
-- Indexes for table `admin_assert`
--
ALTER TABLE `admin_assert`
  ADD PRIMARY KEY (`assert_id`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `IDX_ADMIN_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  ADD KEY `IDX_ADMIN_ROLE_TREE_LEVEL` (`tree_level`);

--
-- Indexes for table `admin_rule`
--
ALTER TABLE `admin_rule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_ADMIN_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  ADD KEY `IDX_ADMIN_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`);

--
-- Indexes for table `api2_acl_attribute`
--
ALTER TABLE `api2_acl_attribute`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_API2_ACL_ATTRIBUTE_USER_TYPE_RESOURCE_ID_OPERATION` (`user_type`,`resource_id`,`operation`),
  ADD KEY `IDX_API2_ACL_ATTRIBUTE_USER_TYPE` (`user_type`);

--
-- Indexes for table `api2_acl_role`
--
ALTER TABLE `api2_acl_role`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_API2_ACL_ROLE_CREATED_AT` (`created_at`),
  ADD KEY `IDX_API2_ACL_ROLE_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `api2_acl_rule`
--
ALTER TABLE `api2_acl_rule`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_API2_ACL_RULE_ROLE_ID_RESOURCE_ID_PRIVILEGE` (`role_id`,`resource_id`,`privilege`);

--
-- Indexes for table `api2_acl_user`
--
ALTER TABLE `api2_acl_user`
  ADD UNIQUE KEY `UNQ_API2_ACL_USER_ADMIN_ID` (`admin_id`),
  ADD KEY `FK_API2_ACL_USER_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` (`role_id`);

--
-- Indexes for table `api_assert`
--
ALTER TABLE `api_assert`
  ADD PRIMARY KEY (`assert_id`);

--
-- Indexes for table `api_role`
--
ALTER TABLE `api_role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `IDX_API_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  ADD KEY `IDX_API_ROLE_TREE_LEVEL` (`tree_level`);

--
-- Indexes for table `api_rule`
--
ALTER TABLE `api_rule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_API_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  ADD KEY `IDX_API_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`);

--
-- Indexes for table `api_session`
--
ALTER TABLE `api_session`
  ADD KEY `IDX_API_SESSION_USER_ID` (`user_id`),
  ADD KEY `IDX_API_SESSION_SESSID` (`sessid`);

--
-- Indexes for table `api_user`
--
ALTER TABLE `api_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `captcha_log`
--
ALTER TABLE `captcha_log`
  ADD PRIMARY KEY (`type`,`value`);

--
-- Indexes for table `cataloginventory_stock`
--
ALTER TABLE `cataloginventory_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `UNQ_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`);

--
-- Indexes for table `cataloginventory_stock_status`
--
ALTER TABLE `cataloginventory_stock_status`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `cataloginventory_stock_status_idx`
--
ALTER TABLE `cataloginventory_stock_status_idx`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `cataloginventory_stock_status_tmp`
--
ALTER TABLE `cataloginventory_stock_status_tmp`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  ADD KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogrule`
--
ALTER TABLE `catalogrule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`);

--
-- Indexes for table `catalogrule_affected_product`
--
ALTER TABLE `catalogrule_affected_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`),
  ADD KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  ADD KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `catalogrule_group_website`
--
ALTER TABLE `catalogrule_group_website`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOGRULE_GROUP_WEBSITE_RULE_ID` (`rule_id`),
  ADD KEY `IDX_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  ADD PRIMARY KEY (`rule_product_id`),
  ADD UNIQUE KEY `EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_RULE_ID` (`rule_id`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  ADD PRIMARY KEY (`rule_product_price_id`),
  ADD UNIQUE KEY `UNQ_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD PRIMARY KEY (`rule_id`,`website_id`),
  ADD KEY `IDX_CATALOGRULE_WEBSITE_RULE_ID` (`rule_id`),
  ADD KEY `IDX_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogsearch_fulltext`
--
ALTER TABLE `catalogsearch_fulltext`
  ADD PRIMARY KEY (`fulltext_id`),
  ADD UNIQUE KEY `UNQ_CATALOGSEARCH_FULLTEXT_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`);
ALTER TABLE `catalogsearch_fulltext` ADD FULLTEXT KEY `FTI_CATALOGSEARCH_FULLTEXT_DATA_INDEX` (`data_index`);

--
-- Indexes for table `catalogsearch_query`
--
ALTER TABLE `catalogsearch_query`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `IDX_CATALOGSEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  ADD KEY `IDX_CATALOGSEARCH_QUERY_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOGSEARCH_QUERY_SYNONYM_FOR` (`synonym_for`);

--
-- Indexes for table `catalogsearch_result`
--
ALTER TABLE `catalogsearch_result`
  ADD PRIMARY KEY (`query_id`,`product_id`),
  ADD KEY `IDX_CATALOGSEARCH_RESULT_QUERY_ID` (`query_id`),
  ADD KEY `IDX_CATALOGSEARCH_RESULT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_category_anc_categs_index_idx`
--
ALTER TABLE `catalog_category_anc_categs_index_idx`
  ADD KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_CATEGORY_ID` (`category_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_PATH_CATEGORY_ID` (`path`,`category_id`);

--
-- Indexes for table `catalog_category_anc_categs_index_tmp`
--
ALTER TABLE `catalog_category_anc_categs_index_tmp`
  ADD KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_CATEGORY_ID` (`category_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_PATH_CATEGORY_ID` (`path`,`category_id`);

--
-- Indexes for table `catalog_category_anc_products_index_idx`
--
ALTER TABLE `catalog_category_anc_products_index_idx`
  ADD KEY `IDX_CAT_CTGR_ANC_PRDS_IDX_IDX_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`);

--
-- Indexes for table `catalog_category_anc_products_index_tmp`
--
ALTER TABLE `catalog_category_anc_products_index_tmp`
  ADD KEY `IDX_CAT_CTGR_ANC_PRDS_IDX_TMP_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`);

--
-- Indexes for table `catalog_category_entity`
--
ALTER TABLE `catalog_category_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_PATH_ENTITY_ID` (`path`,`entity_id`);

--
-- Indexes for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DTIME_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DEC_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_CTGR_ENTT_INT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_CTGR_ENTT_TEXT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_CTGR_ENTT_VCHR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_flat_store_1`
--
ALTER TABLE `catalog_category_flat_store_1`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_FLAT_STORE_1_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_FLAT_STORE_1_PATH` (`path`),
  ADD KEY `IDX_CATALOG_CATEGORY_FLAT_STORE_1_LEVEL` (`level`);

--
-- Indexes for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD PRIMARY KEY (`category_id`,`product_id`),
  ADD KEY `IDX_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_category_product_index`
--
ALTER TABLE `catalog_category_product_index`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `IDX_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  ADD KEY `15D3C269665C74C2219037D534F4B0DC` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`);

--
-- Indexes for table `catalog_category_product_index_enbl_idx`
--
ALTER TABLE `catalog_category_product_index_enbl_idx`
  ADD KEY `IDX_CAT_CTGR_PRD_IDX_ENBL_IDX_PRD_ID_VISIBILITY` (`product_id`,`visibility`);

--
-- Indexes for table `catalog_category_product_index_enbl_tmp`
--
ALTER TABLE `catalog_category_product_index_enbl_tmp`
  ADD KEY `IDX_CAT_CTGR_PRD_IDX_ENBL_TMP_PRD_ID_VISIBILITY` (`product_id`,`visibility`);

--
-- Indexes for table `catalog_category_product_index_idx`
--
ALTER TABLE `catalog_category_product_index_idx`
  ADD KEY `IDX_CAT_CTGR_PRD_IDX_IDX_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`);

--
-- Indexes for table `catalog_category_product_index_tmp`
--
ALTER TABLE `catalog_category_product_index_tmp`
  ADD KEY `IDX_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`);

--
-- Indexes for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD PRIMARY KEY (`catalog_compare_item_id`),
  ADD KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `IDX_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  ADD KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`);

--
-- Indexes for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`);

--
-- Indexes for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`);

--
-- Indexes for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD PRIMARY KEY (`selection_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD PRIMARY KEY (`selection_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_bundle_stock_index`
--
ALTER TABLE `catalog_product_bundle_stock_index`
  ADD PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`);

--
-- Indexes for table `catalog_product_enabled_index`
--
ALTER TABLE `catalog_product_enabled_index`
  ADD PRIMARY KEY (`product_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_SKU` (`sku`);

--
-- Indexes for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_ENTT_GLR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity_group_price`
--
ALTER TABLE `catalog_product_entity_group_price`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CC12C83765B562314470A24F2BDD0F36` (`entity_id`,`all_groups`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD PRIMARY KEY (`value_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `catalog_product_flat_1`
--
ALTER TABLE `catalog_product_flat_1`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_FLAT_1_TYPE_ID` (`type_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_FLAT_1_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_FLAT_1_NAME` (`name`),
  ADD KEY `IDX_CATALOG_PRODUCT_FLAT_1_PRICE` (`price`),
  ADD KEY `IDX_CATALOG_PRODUCT_FLAT_1_STATUS` (`status`);

--
-- Indexes for table `catalog_product_index_eav`
--
ALTER TABLE `catalog_product_index_eav`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal`
--
ALTER TABLE `catalog_product_index_eav_decimal`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal_idx`
--
ALTER TABLE `catalog_product_index_eav_decimal_idx`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal_tmp`
--
ALTER TABLE `catalog_product_index_eav_decimal_tmp`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_idx`
--
ALTER TABLE `catalog_product_index_eav_idx`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_tmp`
--
ALTER TABLE `catalog_product_index_eav_tmp`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_group_price`
--
ALTER TABLE `catalog_product_index_group_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_index_price`
--
ALTER TABLE `catalog_product_index_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  ADD KEY `IDX_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`);

--
-- Indexes for table `catalog_product_index_price_bundle_idx`
--
ALTER TABLE `catalog_product_index_price_bundle_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_opt_idx`
--
ALTER TABLE `catalog_product_index_price_bundle_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_opt_tmp`
--
ALTER TABLE `catalog_product_index_price_bundle_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_sel_idx`
--
ALTER TABLE `catalog_product_index_price_bundle_sel_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_sel_tmp`
--
ALTER TABLE `catalog_product_index_price_bundle_sel_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_tmp`
--
ALTER TABLE `catalog_product_index_price_bundle_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_agr_idx`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx`
  ADD PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_agr_tmp`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp`
  ADD PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_idx`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_tmp`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_downlod_idx`
--
ALTER TABLE `catalog_product_index_price_downlod_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_downlod_tmp`
--
ALTER TABLE `catalog_product_index_price_downlod_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_final_idx`
--
ALTER TABLE `catalog_product_index_price_final_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_final_tmp`
--
ALTER TABLE `catalog_product_index_price_final_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_idx`
--
ALTER TABLE `catalog_product_index_price_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`);

--
-- Indexes for table `catalog_product_index_price_opt_agr_idx`
--
ALTER TABLE `catalog_product_index_price_opt_agr_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_opt_agr_tmp`
--
ALTER TABLE `catalog_product_index_price_opt_agr_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_opt_idx`
--
ALTER TABLE `catalog_product_index_price_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_opt_tmp`
--
ALTER TABLE `catalog_product_index_price_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_tmp`
--
ALTER TABLE `catalog_product_index_price_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`);

--
-- Indexes for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD PRIMARY KEY (`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`);

--
-- Indexes for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_LINK_TYPE_ID` (`link_type_id`);

--
-- Indexes for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD PRIMARY KEY (`product_link_attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`);

--
-- Indexes for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `IDX_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`);

--
-- Indexes for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_PRODUCT_LINK_ATTRIBUTE_ID` (`product_link_attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`);

--
-- Indexes for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `IDX_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`);

--
-- Indexes for table `catalog_product_link_type`
--
ALTER TABLE `catalog_product_link_type`
  ADD PRIMARY KEY (`link_type_id`);

--
-- Indexes for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD PRIMARY KEY (`option_price_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID` (`option_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD PRIMARY KEY (`option_title_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID` (`option_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD PRIMARY KEY (`option_type_price_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID` (`option_type_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD PRIMARY KEY (`option_type_title_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID` (`option_type_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD PRIMARY KEY (`option_type_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`);

--
-- Indexes for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD PRIMARY KEY (`parent_id`,`child_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`);

--
-- Indexes for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD PRIMARY KEY (`product_super_attribute_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  ADD KEY `IDX_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_super_attribute_pricing`
--
ALTER TABLE `catalog_product_super_attribute_pricing`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID_VAL_IDX_WS_ID` (`product_super_attribute_id`,`value_index`,`website_id`),
  ADD KEY `IDX_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRICING_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD PRIMARY KEY (`product_id`,`website_id`),
  ADD KEY `IDX_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `checkout_agreement`
--
ALTER TABLE `checkout_agreement`
  ADD PRIMARY KEY (`agreement_id`);

--
-- Indexes for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD PRIMARY KEY (`agreement_id`,`store_id`),
  ADD KEY `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_CORE_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `cms_block`
--
ALTER TABLE `cms_block`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD PRIMARY KEY (`block_id`,`store_id`),
  ADD KEY `IDX_CMS_BLOCK_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `cms_page`
--
ALTER TABLE `cms_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `IDX_CMS_PAGE_IDENTIFIER` (`identifier`);

--
-- Indexes for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD PRIMARY KEY (`page_id`,`store_id`),
  ADD KEY `IDX_CMS_PAGE_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `core_cache`
--
ALTER TABLE `core_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CORE_CACHE_EXPIRE_TIME` (`expire_time`);

--
-- Indexes for table `core_cache_option`
--
ALTER TABLE `core_cache_option`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `core_cache_tag`
--
ALTER TABLE `core_cache_tag`
  ADD PRIMARY KEY (`tag`,`cache_id`),
  ADD KEY `IDX_CORE_CACHE_TAG_CACHE_ID` (`cache_id`);

--
-- Indexes for table `core_config_data`
--
ALTER TABLE `core_config_data`
  ADD PRIMARY KEY (`config_id`),
  ADD UNIQUE KEY `UNQ_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`);

--
-- Indexes for table `core_email_queue`
--
ALTER TABLE `core_email_queue`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `0ADECE62FD629241C147389ADF20706E` (`entity_id`,`entity_type`,`event_type`,`message_body_hash`);

--
-- Indexes for table `core_email_queue_recipients`
--
ALTER TABLE `core_email_queue_recipients`
  ADD PRIMARY KEY (`recipient_id`),
  ADD UNIQUE KEY `19BDB9C5FE4BD685FCF992A71E976CD0` (`message_id`,`recipient_email`,`email_type`),
  ADD KEY `IDX_CORE_EMAIL_QUEUE_RECIPIENTS_RECIPIENT_EMAIL` (`recipient_email`),
  ADD KEY `IDX_CORE_EMAIL_QUEUE_RECIPIENTS_EMAIL_TYPE` (`email_type`);

--
-- Indexes for table `core_email_template`
--
ALTER TABLE `core_email_template`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `UNQ_CORE_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  ADD KEY `IDX_CORE_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  ADD KEY `IDX_CORE_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `core_flag`
--
ALTER TABLE `core_flag`
  ADD PRIMARY KEY (`flag_id`),
  ADD KEY `IDX_CORE_FLAG_LAST_UPDATE` (`last_update`);

--
-- Indexes for table `core_layout_link`
--
ALTER TABLE `core_layout_link`
  ADD PRIMARY KEY (`layout_link_id`),
  ADD UNIQUE KEY `UNQ_CORE_LAYOUT_LINK_STORE_ID_PACKAGE_THEME_LAYOUT_UPDATE_ID` (`store_id`,`package`,`theme`,`layout_update_id`),
  ADD KEY `IDX_CORE_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`);

--
-- Indexes for table `core_layout_update`
--
ALTER TABLE `core_layout_update`
  ADD PRIMARY KEY (`layout_update_id`),
  ADD KEY `IDX_CORE_LAYOUT_UPDATE_HANDLE` (`handle`);

--
-- Indexes for table `core_resource`
--
ALTER TABLE `core_resource`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `core_session`
--
ALTER TABLE `core_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `core_store`
--
ALTER TABLE `core_store`
  ADD PRIMARY KEY (`store_id`),
  ADD UNIQUE KEY `UNQ_CORE_STORE_CODE` (`code`),
  ADD KEY `IDX_CORE_STORE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CORE_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  ADD KEY `IDX_CORE_STORE_GROUP_ID` (`group_id`);

--
-- Indexes for table `core_store_group`
--
ALTER TABLE `core_store_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `IDX_CORE_STORE_GROUP_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_CORE_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`);

--
-- Indexes for table `core_translate`
--
ALTER TABLE `core_translate`
  ADD PRIMARY KEY (`key_id`),
  ADD UNIQUE KEY `UNQ_CORE_TRANSLATE_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  ADD KEY `IDX_CORE_TRANSLATE_STORE_ID` (`store_id`);

--
-- Indexes for table `core_url_rewrite`
--
ALTER TABLE `core_url_rewrite`
  ADD PRIMARY KEY (`url_rewrite_id`),
  ADD UNIQUE KEY `UNQ_CORE_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  ADD UNIQUE KEY `UNQ_CORE_URL_REWRITE_ID_PATH_IS_SYSTEM_STORE_ID` (`id_path`,`is_system`,`store_id`),
  ADD KEY `IDX_CORE_URL_REWRITE_TARGET_PATH_STORE_ID` (`target_path`,`store_id`),
  ADD KEY `IDX_CORE_URL_REWRITE_ID_PATH` (`id_path`),
  ADD KEY `IDX_CORE_URL_REWRITE_STORE_ID` (`store_id`),
  ADD KEY `FK_CORE_URL_REWRITE_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` (`category_id`),
  ADD KEY `FK_CORE_URL_REWRITE_PRODUCT_ID_CATALOG_CATEGORY_ENTITY_ENTITY_ID` (`product_id`);

--
-- Indexes for table `core_variable`
--
ALTER TABLE `core_variable`
  ADD PRIMARY KEY (`variable_id`),
  ADD UNIQUE KEY `UNQ_CORE_VARIABLE_CODE` (`code`);

--
-- Indexes for table `core_variable_value`
--
ALTER TABLE `core_variable_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CORE_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  ADD KEY `IDX_CORE_VARIABLE_VALUE_VARIABLE_ID` (`variable_id`),
  ADD KEY `IDX_CORE_VARIABLE_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `core_website`
--
ALTER TABLE `core_website`
  ADD PRIMARY KEY (`website_id`),
  ADD UNIQUE KEY `UNQ_CORE_WEBSITE_CODE` (`code`),
  ADD KEY `IDX_CORE_WEBSITE_SORT_ORDER` (`sort_order`),
  ADD KEY `IDX_CORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`);

--
-- Indexes for table `coupon_aggregated`
--
ALTER TABLE `coupon_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_COUPON_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `IDX_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  ADD KEY `IDX_COUPON_AGGREGATED_RULE_NAME` (`rule_name`);

--
-- Indexes for table `coupon_aggregated_order`
--
ALTER TABLE `coupon_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_COUPON_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `IDX_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  ADD KEY `IDX_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`);

--
-- Indexes for table `coupon_aggregated_updated`
--
ALTER TABLE `coupon_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_COUPON_AGGRED_UPDATED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `IDX_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  ADD KEY `IDX_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`);

--
-- Indexes for table `cron_schedule`
--
ALTER TABLE `cron_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `IDX_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  ADD KEY `IDX_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`);

--
-- Indexes for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`);

--
-- Indexes for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD PRIMARY KEY (`attribute_id`,`website_id`),
  ADD KEY `IDX_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_flowpassword`
--
ALTER TABLE `customer_flowpassword`
  ADD PRIMARY KEY (`flowpassword_id`),
  ADD KEY `IDX_CUSTOMER_FLOWPASSWORD_EMAIL` (`email`),
  ADD KEY `IDX_CUSTOMER_FLOWPASSWORD_IP` (`ip`),
  ADD KEY `IDX_CUSTOMER_FLOWPASSWORD_REQUESTED_DATE` (`requested_date`);

--
-- Indexes for table `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD PRIMARY KEY (`form_code`,`attribute_id`),
  ADD KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `dataflow_batch`
--
ALTER TABLE `dataflow_batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `IDX_DATAFLOW_BATCH_PROFILE_ID` (`profile_id`),
  ADD KEY `IDX_DATAFLOW_BATCH_STORE_ID` (`store_id`),
  ADD KEY `IDX_DATAFLOW_BATCH_CREATED_AT` (`created_at`);

--
-- Indexes for table `dataflow_batch_export`
--
ALTER TABLE `dataflow_batch_export`
  ADD PRIMARY KEY (`batch_export_id`),
  ADD KEY `IDX_DATAFLOW_BATCH_EXPORT_BATCH_ID` (`batch_id`);

--
-- Indexes for table `dataflow_batch_import`
--
ALTER TABLE `dataflow_batch_import`
  ADD PRIMARY KEY (`batch_import_id`),
  ADD KEY `IDX_DATAFLOW_BATCH_IMPORT_BATCH_ID` (`batch_id`);

--
-- Indexes for table `dataflow_import_data`
--
ALTER TABLE `dataflow_import_data`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `IDX_DATAFLOW_IMPORT_DATA_SESSION_ID` (`session_id`);

--
-- Indexes for table `dataflow_profile`
--
ALTER TABLE `dataflow_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `dataflow_profile_history`
--
ALTER TABLE `dataflow_profile_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `IDX_DATAFLOW_PROFILE_HISTORY_PROFILE_ID` (`profile_id`);

--
-- Indexes for table `dataflow_session`
--
ALTER TABLE `dataflow_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `design_change`
--
ALTER TABLE `design_change`
  ADD PRIMARY KEY (`design_change_id`),
  ADD KEY `IDX_DESIGN_CHANGE_STORE_ID` (`store_id`);

--
-- Indexes for table `directory_country`
--
ALTER TABLE `directory_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `directory_country_format`
--
ALTER TABLE `directory_country_format`
  ADD PRIMARY KEY (`country_format_id`),
  ADD UNIQUE KEY `UNQ_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`);

--
-- Indexes for table `directory_country_region`
--
ALTER TABLE `directory_country_region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `IDX_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`);

--
-- Indexes for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD PRIMARY KEY (`locale`,`region_id`),
  ADD KEY `IDX_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`);

--
-- Indexes for table `directory_currency_rate`
--
ALTER TABLE `directory_currency_rate`
  ADD PRIMARY KEY (`currency_from`,`currency_to`),
  ADD KEY `IDX_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`);

--
-- Indexes for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`);

--
-- Indexes for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`purchased_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`);

--
-- Indexes for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD PRIMARY KEY (`title_id`),
  ADD UNIQUE KEY `UNQ_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_TITLE_LINK_ID` (`link_id`),
  ADD KEY `IDX_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD PRIMARY KEY (`sample_id`),
  ADD KEY `IDX_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD PRIMARY KEY (`title_id`),
  ADD UNIQUE KEY `UNQ_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  ADD KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID` (`sample_id`),
  ADD KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `UNQ_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  ADD KEY `IDX_EAV_ATTRIBUTE_ENTITY_TYPE_ID` (`entity_type_id`);

--
-- Indexes for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`),
  ADD UNIQUE KEY `UNQ_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  ADD KEY `IDX_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`);

--
-- Indexes for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD PRIMARY KEY (`attribute_label_id`),
  ADD KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  ADD KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`);

--
-- Indexes for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  ADD KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD PRIMARY KEY (`attribute_set_id`),
  ADD UNIQUE KEY `UNQ_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  ADD KEY `IDX_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`);

--
-- Indexes for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD PRIMARY KEY (`entity_attribute_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  ADD KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  ADD KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  ADD KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  ADD KEY `IDX_EAV_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD PRIMARY KEY (`entity_store_id`),
  ADD KEY `IDX_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  ADD KEY `IDX_EAV_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  ADD PRIMARY KEY (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`);

--
-- Indexes for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  ADD KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD PRIMARY KEY (`element_id`),
  ADD UNIQUE KEY `UNQ_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  ADD KEY `IDX_EAV_FORM_ELEMENT_TYPE_ID` (`type_id`),
  ADD KEY `IDX_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  ADD KEY `IDX_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD PRIMARY KEY (`fieldset_id`),
  ADD UNIQUE KEY `UNQ_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  ADD KEY `IDX_EAV_FORM_FIELDSET_TYPE_ID` (`type_id`);

--
-- Indexes for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD PRIMARY KEY (`fieldset_id`,`store_id`),
  ADD KEY `IDX_EAV_FORM_FIELDSET_LABEL_FIELDSET_ID` (`fieldset_id`),
  ADD KEY `IDX_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `UNQ_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  ADD KEY `IDX_EAV_FORM_TYPE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD PRIMARY KEY (`type_id`,`entity_type_id`),
  ADD KEY `IDX_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`);

--
-- Indexes for table `gift_message`
--
ALTER TABLE `gift_message`
  ADD PRIMARY KEY (`gift_message_id`);

--
-- Indexes for table `importexport_importdata`
--
ALTER TABLE `importexport_importdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_event`
--
ALTER TABLE `index_event`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `UNQ_INDEX_EVENT_TYPE_ENTITY_ENTITY_PK` (`type`,`entity`,`entity_pk`);

--
-- Indexes for table `index_process`
--
ALTER TABLE `index_process`
  ADD PRIMARY KEY (`process_id`),
  ADD UNIQUE KEY `UNQ_INDEX_PROCESS_INDEXER_CODE` (`indexer_code`);

--
-- Indexes for table `index_process_event`
--
ALTER TABLE `index_process_event`
  ADD PRIMARY KEY (`process_id`,`event_id`),
  ADD KEY `IDX_INDEX_PROCESS_EVENT_EVENT_ID` (`event_id`);

--
-- Indexes for table `log_customer`
--
ALTER TABLE `log_customer`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `IDX_LOG_CUSTOMER_VISITOR_ID` (`visitor_id`);

--
-- Indexes for table `log_quote`
--
ALTER TABLE `log_quote`
  ADD PRIMARY KEY (`quote_id`);

--
-- Indexes for table `log_summary`
--
ALTER TABLE `log_summary`
  ADD PRIMARY KEY (`summary_id`);

--
-- Indexes for table `log_summary_type`
--
ALTER TABLE `log_summary_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `log_url`
--
ALTER TABLE `log_url`
  ADD KEY `IDX_LOG_URL_VISITOR_ID` (`visitor_id`),
  ADD KEY `url_id` (`url_id`);

--
-- Indexes for table `log_url_info`
--
ALTER TABLE `log_url_info`
  ADD PRIMARY KEY (`url_id`);

--
-- Indexes for table `log_visitor`
--
ALTER TABLE `log_visitor`
  ADD PRIMARY KEY (`visitor_id`);

--
-- Indexes for table `log_visitor_info`
--
ALTER TABLE `log_visitor_info`
  ADD PRIMARY KEY (`visitor_id`);

--
-- Indexes for table `log_visitor_online`
--
ALTER TABLE `log_visitor_online`
  ADD PRIMARY KEY (`visitor_id`),
  ADD KEY `IDX_LOG_VISITOR_ONLINE_VISITOR_TYPE` (`visitor_type`),
  ADD KEY `IDX_LOG_VISITOR_ONLINE_FIRST_VISIT_AT_LAST_VISIT_AT` (`first_visit_at`,`last_visit_at`),
  ADD KEY `IDX_LOG_VISITOR_ONLINE_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD PRIMARY KEY (`problem_id`),
  ADD KEY `IDX_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  ADD KEY `IDX_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`);

--
-- Indexes for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD PRIMARY KEY (`queue_id`),
  ADD KEY `IDX_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`);

--
-- Indexes for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD PRIMARY KEY (`queue_link_id`),
  ADD KEY `IDX_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  ADD KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID` (`queue_id`),
  ADD KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`);

--
-- Indexes for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD PRIMARY KEY (`queue_id`,`store_id`),
  ADD KEY `IDX_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`);

--
-- Indexes for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD PRIMARY KEY (`subscriber_id`),
  ADD KEY `IDX_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`);

--
-- Indexes for table `newsletter_template`
--
ALTER TABLE `newsletter_template`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `IDX_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  ADD KEY `IDX_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  ADD KEY `IDX_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OAUTH_CONSUMER_KEY` (`key`),
  ADD UNIQUE KEY `UNQ_OAUTH_CONSUMER_SECRET` (`secret`),
  ADD KEY `IDX_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `oauth_nonce`
--
ALTER TABLE `oauth_nonce`
  ADD UNIQUE KEY `UNQ_OAUTH_NONCE_NONCE` (`nonce`);

--
-- Indexes for table `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OAUTH_TOKEN_TOKEN` (`token`),
  ADD KEY `IDX_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  ADD KEY `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  ADD KEY `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`);

--
-- Indexes for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  ADD PRIMARY KEY (`cert_id`),
  ADD KEY `IDX_PAYPAL_CERT_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `paypal_payment_transaction`
--
ALTER TABLE `paypal_payment_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `UNQ_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`);

--
-- Indexes for table `paypal_settlement_report`
--
ALTER TABLE `paypal_settlement_report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `UNQ_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`);

--
-- Indexes for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `IDX_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`);

--
-- Indexes for table `permission_block`
--
ALTER TABLE `permission_block`
  ADD PRIMARY KEY (`block_id`),
  ADD UNIQUE KEY `UNQ_PERMISSION_BLOCK_BLOCK_NAME` (`block_name`);

--
-- Indexes for table `permission_variable`
--
ALTER TABLE `permission_variable`
  ADD PRIMARY KEY (`variable_id`,`variable_name`),
  ADD UNIQUE KEY `UNQ_PERMISSION_VARIABLE_VARIABLE_NAME` (`variable_name`);

--
-- Indexes for table `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD PRIMARY KEY (`persistent_id`),
  ADD UNIQUE KEY `IDX_PERSISTENT_SESSION_KEY` (`key`),
  ADD UNIQUE KEY `IDX_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  ADD KEY `FK_PERSISTENT_SESSION_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`poll_id`),
  ADD KEY `IDX_POLL_STORE_ID` (`store_id`);

--
-- Indexes for table `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `IDX_POLL_ANSWER_POLL_ID` (`poll_id`);

--
-- Indexes for table `poll_store`
--
ALTER TABLE `poll_store`
  ADD PRIMARY KEY (`poll_id`,`store_id`),
  ADD KEY `IDX_POLL_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `IDX_POLL_VOTE_POLL_ANSWER_ID` (`poll_answer_id`);

--
-- Indexes for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD PRIMARY KEY (`alert_price_id`),
  ADD KEY `IDX_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD PRIMARY KEY (`alert_stock_id`),
  ADD KEY `IDX_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `UNQ_RATING_RATING_CODE` (`rating_code`),
  ADD KEY `IDX_RATING_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `rating_entity`
--
ALTER TABLE `rating_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_RATING_ENTITY_ENTITY_CODE` (`entity_code`);

--
-- Indexes for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_RATING_OPTION_RATING_ID` (`rating_id`);

--
-- Indexes for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `IDX_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  ADD KEY `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`);

--
-- Indexes for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD PRIMARY KEY (`primary_id`),
  ADD KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  ADD KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD PRIMARY KEY (`rating_id`,`store_id`),
  ADD KEY `IDX_RATING_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD PRIMARY KEY (`rating_id`,`store_id`),
  ADD KEY `IDX_RATING_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD PRIMARY KEY (`index_id`),
  ADD UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  ADD KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  ADD KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_event`
--
ALTER TABLE `report_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `IDX_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  ADD KEY `IDX_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  ADD KEY `IDX_REPORT_EVENT_OBJECT_ID` (`object_id`),
  ADD KEY `IDX_REPORT_EVENT_SUBTYPE` (`subtype`),
  ADD KEY `IDX_REPORT_EVENT_STORE_ID` (`store_id`);

--
-- Indexes for table `report_event_types`
--
ALTER TABLE `report_event_types`
  ADD PRIMARY KEY (`event_type_id`);

--
-- Indexes for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD PRIMARY KEY (`index_id`),
  ADD UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  ADD KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `IDX_REVIEW_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_REVIEW_STATUS_ID` (`status_id`),
  ADD KEY `IDX_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`);

--
-- Indexes for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `IDX_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  ADD KEY `IDX_REVIEW_DETAIL_STORE_ID` (`store_id`),
  ADD KEY `IDX_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `review_entity`
--
ALTER TABLE `review_entity`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD PRIMARY KEY (`primary_id`),
  ADD KEY `IDX_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`);

--
-- Indexes for table `review_status`
--
ALTER TABLE `review_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `review_store`
--
ALTER TABLE `review_store`
  ADD PRIMARY KEY (`review_id`,`store_id`),
  ADD KEY `IDX_REVIEW_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `salesrule`
--
ALTER TABLE `salesrule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`);

--
-- Indexes for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `UNQ_SALESRULE_COUPON_CODE` (`code`),
  ADD UNIQUE KEY `UNQ_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  ADD KEY `IDX_SALESRULE_COUPON_RULE_ID` (`rule_id`);

--
-- Indexes for table `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD PRIMARY KEY (`coupon_id`,`customer_id`),
  ADD KEY `IDX_SALESRULE_COUPON_USAGE_COUPON_ID` (`coupon_id`),
  ADD KEY `IDX_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD PRIMARY KEY (`rule_customer_id`),
  ADD KEY `IDX_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  ADD KEY `IDX_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`);

--
-- Indexes for table `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`),
  ADD KEY `IDX_SALESRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  ADD KEY `IDX_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD PRIMARY KEY (`label_id`),
  ADD UNIQUE KEY `UNQ_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  ADD KEY `IDX_SALESRULE_LABEL_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALESRULE_LABEL_RULE_ID` (`rule_id`);

--
-- Indexes for table `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  ADD KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD PRIMARY KEY (`rule_id`,`website_id`),
  ADD KEY `IDX_SALESRULE_WEBSITE_RULE_ID` (`rule_id`),
  ADD KEY `IDX_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `sales_billing_agreement`
--
ALTER TABLE `sales_billing_agreement`
  ADD PRIMARY KEY (`agreement_id`),
  ADD KEY `IDX_SALES_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_SALES_BILLING_AGREEMENT_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_billing_agreement_order`
--
ALTER TABLE `sales_billing_agreement_order`
  ADD PRIMARY KEY (`agreement_id`,`order_id`),
  ADD KEY `IDX_SALES_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`);

--
-- Indexes for table `sales_flat_creditmemo`
--
ALTER TABLE `sales_flat_creditmemo`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_CREDITMEMO_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_STATE` (`state`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_CREATED_AT` (`created_at`);

--
-- Indexes for table `sales_flat_creditmemo_comment`
--
ALTER TABLE `sales_flat_creditmemo_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_creditmemo_grid`
--
ALTER TABLE `sales_flat_creditmemo_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_CREDITMEMO_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_CREDITMEMO_STATUS` (`creditmemo_status`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_STATE` (`state`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`);

--
-- Indexes for table `sales_flat_creditmemo_item`
--
ALTER TABLE `sales_flat_creditmemo_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_invoice`
--
ALTER TABLE `sales_flat_invoice`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_INVOICE_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_STATE` (`state`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_CREATED_AT` (`created_at`);

--
-- Indexes for table `sales_flat_invoice_comment`
--
ALTER TABLE `sales_flat_invoice_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_invoice_grid`
--
ALTER TABLE `sales_flat_invoice_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_INVOICE_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_STATE` (`state`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_GRID_BILLING_NAME` (`billing_name`);

--
-- Indexes for table `sales_flat_invoice_item`
--
ALTER TABLE `sales_flat_invoice_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_INVOICE_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_order`
--
ALTER TABLE `sales_flat_order`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_ORDER_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_STATUS` (`status`),
  ADD KEY `IDX_SALES_FLAT_ORDER_STATE` (`state`),
  ADD KEY `IDX_SALES_FLAT_ORDER_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_ORDER_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_QUOTE_ID` (`quote_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `sales_flat_order_address`
--
ALTER TABLE `sales_flat_order_address`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_ADDRESS_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_order_grid`
--
ALTER TABLE `sales_flat_order_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_ORDER_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_STATUS` (`status`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_BILLING_NAME` (`billing_name`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_GRID_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `sales_flat_order_item`
--
ALTER TABLE `sales_flat_order_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_ITEM_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_flat_order_payment`
--
ALTER TABLE `sales_flat_order_payment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_PAYMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_order_status_history`
--
ALTER TABLE `sales_flat_order_status_history`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_SALES_FLAT_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`);

--
-- Indexes for table `sales_flat_quote`
--
ALTER TABLE `sales_flat_quote`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_flat_quote_address`
--
ALTER TABLE `sales_flat_quote_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`);

--
-- Indexes for table `sales_flat_quote_address_item`
--
ALTER TABLE `sales_flat_quote_address_item`
  ADD PRIMARY KEY (`address_item_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`);

--
-- Indexes for table `sales_flat_quote_item`
--
ALTER TABLE `sales_flat_quote_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_flat_quote_item_option`
--
ALTER TABLE `sales_flat_quote_item_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`);

--
-- Indexes for table `sales_flat_quote_payment`
--
ALTER TABLE `sales_flat_quote_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`);

--
-- Indexes for table `sales_flat_quote_shipping_rate`
--
ALTER TABLE `sales_flat_quote_shipping_rate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `IDX_SALES_FLAT_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`);

--
-- Indexes for table `sales_flat_shipment`
--
ALTER TABLE `sales_flat_shipment`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_SHIPMENT_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_TOTAL_QTY` (`total_qty`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `sales_flat_shipment_comment`
--
ALTER TABLE `sales_flat_shipment_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_shipment_grid`
--
ALTER TABLE `sales_flat_shipment_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_SALES_FLAT_SHIPMENT_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`);

--
-- Indexes for table `sales_flat_shipment_item`
--
ALTER TABLE `sales_flat_shipment_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_flat_shipment_track`
--
ALTER TABLE `sales_flat_shipment_track`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_CREATED_AT` (`created_at`);

--
-- Indexes for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_status`
--
ALTER TABLE `sales_order_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD PRIMARY KEY (`status`,`store_id`),
  ADD KEY `IDX_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD PRIMARY KEY (`status`,`state`);

--
-- Indexes for table `sales_order_tax`
--
ALTER TABLE `sales_order_tax`
  ADD PRIMARY KEY (`tax_id`),
  ADD KEY `IDX_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`);

--
-- Indexes for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD PRIMARY KEY (`tax_item_id`),
  ADD UNIQUE KEY `UNQ_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  ADD KEY `IDX_SALES_ORDER_TAX_ITEM_TAX_ID` (`tax_id`),
  ADD KEY `IDX_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`);

--
-- Indexes for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `UNQ_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  ADD KEY `IDX_SALES_PAYMENT_TRANSACTION_ORDER_ID` (`order_id`),
  ADD KEY `IDX_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`);

--
-- Indexes for table `sales_recurring_profile`
--
ALTER TABLE `sales_recurring_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `UNQ_SALES_RECURRING_PROFILE_INTERNAL_REFERENCE_ID` (`internal_reference_id`),
  ADD KEY `IDX_SALES_RECURRING_PROFILE_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_SALES_RECURRING_PROFILE_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_recurring_profile_order`
--
ALTER TABLE `sales_recurring_profile_order`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `UNQ_SALES_RECURRING_PROFILE_ORDER_PROFILE_ID_ORDER_ID` (`profile_id`,`order_id`),
  ADD KEY `IDX_SALES_RECURRING_PROFILE_ORDER_ORDER_ID` (`order_id`);

--
-- Indexes for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  ADD KEY `IDX_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  ADD KEY `IDX_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `sendfriend_log`
--
ALTER TABLE `sendfriend_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `IDX_SENDFRIEND_LOG_IP` (`ip`),
  ADD KEY `IDX_SENDFRIEND_LOG_TIME` (`time`);

--
-- Indexes for table `shipping_tablerate`
--
ALTER TABLE `shipping_tablerate`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`);

--
-- Indexes for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD PRIMARY KEY (`sitemap_id`),
  ADD KEY `IDX_SITEMAP_STORE_ID` (`store_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `FK_TAG_FIRST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`first_customer_id`),
  ADD KEY `FK_TAG_FIRST_STORE_ID_CORE_STORE_STORE_ID` (`first_store_id`);

--
-- Indexes for table `tag_properties`
--
ALTER TABLE `tag_properties`
  ADD PRIMARY KEY (`tag_id`,`store_id`),
  ADD KEY `IDX_TAG_PROPERTIES_STORE_ID` (`store_id`);

--
-- Indexes for table `tag_relation`
--
ALTER TABLE `tag_relation`
  ADD PRIMARY KEY (`tag_relation_id`),
  ADD UNIQUE KEY `UNQ_TAG_RELATION_TAG_ID_CUSTOMER_ID_PRODUCT_ID_STORE_ID` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  ADD KEY `IDX_TAG_RELATION_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_TAG_RELATION_TAG_ID` (`tag_id`),
  ADD KEY `IDX_TAG_RELATION_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_TAG_RELATION_STORE_ID` (`store_id`);

--
-- Indexes for table `tag_summary`
--
ALTER TABLE `tag_summary`
  ADD PRIMARY KEY (`tag_id`,`store_id`),
  ADD KEY `IDX_TAG_SUMMARY_STORE_ID` (`store_id`),
  ADD KEY `IDX_TAG_SUMMARY_TAG_ID` (`tag_id`);

--
-- Indexes for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD PRIMARY KEY (`tax_calculation_id`),
  ADD KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  ADD KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  ADD KEY `IDX_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  ADD KEY `IDX_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  ADD KEY `IDX_TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`);

--
-- Indexes for table `tax_calculation_rate`
--
ALTER TABLE `tax_calculation_rate`
  ADD PRIMARY KEY (`tax_calculation_rate_id`),
  ADD KEY `IDX_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  ADD KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  ADD KEY `CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`);

--
-- Indexes for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD PRIMARY KEY (`tax_calculation_rate_title_id`),
  ADD KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  ADD KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  ADD KEY `IDX_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `tax_calculation_rule`
--
ALTER TABLE `tax_calculation_rule`
  ADD PRIMARY KEY (`tax_calculation_rule_id`),
  ADD KEY `IDX_TAX_CALC_RULE_PRIORITY_POSITION_TAX_CALC_RULE_ID` (`priority`,`position`,`tax_calculation_rule_id`),
  ADD KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `FCA5E2C02689EB2641B30580D7AACF12` (`period`,`store_id`,`code`,`percent`,`order_status`),
  ADD KEY `IDX_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`);

--
-- Indexes for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DB0AF14011199AA6CD31D5078B90AA8D` (`period`,`store_id`,`code`,`percent`,`order_status`),
  ADD KEY `IDX_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`);

--
-- Indexes for table `weee_discount`
--
ALTER TABLE `weee_discount`
  ADD KEY `IDX_WEEE_DISCOUNT_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_WEEE_DISCOUNT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_WEEE_DISCOUNT_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `IDX_WEEE_TAX_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_WEEE_TAX_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_WEEE_TAX_COUNTRY` (`country`),
  ADD KEY `IDX_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`widget_id`),
  ADD KEY `IDX_WIDGET_WIDGET_CODE` (`widget_code`);

--
-- Indexes for table `widget_instance`
--
ALTER TABLE `widget_instance`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `IDX_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`);

--
-- Indexes for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD UNIQUE KEY `UNQ_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  ADD KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  ADD KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID` (`layout_update_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `UNQ_WISHLIST_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_WISHLIST_SHARED` (`shared`);

--
-- Indexes for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD PRIMARY KEY (`wishlist_item_id`),
  ADD KEY `IDX_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  ADD KEY `IDX_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_WISHLIST_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminnotification_inbox`
--
ALTER TABLE `adminnotification_inbox`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Notification id';

--
-- AUTO_INCREMENT for table `admin_assert`
--
ALTER TABLE `admin_assert`
  MODIFY `assert_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Assert ID';

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_rule`
--
ALTER TABLE `admin_rule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api2_acl_attribute`
--
ALTER TABLE `api2_acl_attribute`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `api2_acl_role`
--
ALTER TABLE `api2_acl_role`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api2_acl_rule`
--
ALTER TABLE `api2_acl_rule`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `api_assert`
--
ALTER TABLE `api_assert`
  MODIFY `assert_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Assert id';

--
-- AUTO_INCREMENT for table `api_role`
--
ALTER TABLE `api_role`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role id';

--
-- AUTO_INCREMENT for table `api_rule`
--
ALTER TABLE `api_rule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Api rule Id';

--
-- AUTO_INCREMENT for table `api_user`
--
ALTER TABLE `api_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User id';

--
-- AUTO_INCREMENT for table `cataloginventory_stock`
--
ALTER TABLE `cataloginventory_stock`
  MODIFY `stock_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Stock Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `catalogrule`
--
ALTER TABLE `catalogrule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  MODIFY `rule_product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  MODIFY `rule_product_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId', AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `catalogsearch_fulltext`
--
ALTER TABLE `catalogsearch_fulltext`
  MODIFY `fulltext_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `catalogsearch_query`
--
ALTER TABLE `catalogsearch_query`
  MODIFY `query_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Query ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `catalog_category_entity`
--
ALTER TABLE `catalog_category_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  MODIFY `catalog_compare_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID';

--
-- AUTO_INCREMENT for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id';

--
-- AUTO_INCREMENT for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  MODIFY `selection_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Selection Id';

--
-- AUTO_INCREMENT for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=616;

--
-- AUTO_INCREMENT for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_group_price`
--
ALTER TABLE `catalog_product_entity_group_price`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=1160;

--
-- AUTO_INCREMENT for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  MODIFY `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_type`
--
ALTER TABLE `catalog_product_link_type`
  MODIFY `link_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  MODIFY `option_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  MODIFY `option_title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  MODIFY `option_type_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  MODIFY `option_type_title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  MODIFY `option_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  MODIFY `product_super_attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_attribute_pricing`
--
ALTER TABLE `catalog_product_super_attribute_pricing`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';

--
-- AUTO_INCREMENT for table `checkout_agreement`
--
ALTER TABLE `checkout_agreement`
  MODIFY `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_block`
--
ALTER TABLE `cms_block`
  MODIFY `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cms_page`
--
ALTER TABLE `cms_page`
  MODIFY `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `core_config_data`
--
ALTER TABLE `core_config_data`
  MODIFY `config_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Config Id', AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `core_email_queue`
--
ALTER TABLE `core_email_queue`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Message Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_email_queue_recipients`
--
ALTER TABLE `core_email_queue_recipients`
  MODIFY `recipient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Recipient Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_email_template`
--
ALTER TABLE `core_email_template`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template Id';

--
-- AUTO_INCREMENT for table `core_flag`
--
ALTER TABLE `core_flag`
  MODIFY `flag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Flag Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `core_layout_link`
--
ALTER TABLE `core_layout_link`
  MODIFY `layout_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_layout_update`
--
ALTER TABLE `core_layout_update`
  MODIFY `layout_update_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_store`
--
ALTER TABLE `core_store`
  MODIFY `store_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Store Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_store_group`
--
ALTER TABLE `core_store_group`
  MODIFY `group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Group Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_translate`
--
ALTER TABLE `core_translate`
  MODIFY `key_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation';

--
-- AUTO_INCREMENT for table `core_url_rewrite`
--
ALTER TABLE `core_url_rewrite`
  MODIFY `url_rewrite_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id', AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `core_variable`
--
ALTER TABLE `core_variable`
  MODIFY `variable_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Id';

--
-- AUTO_INCREMENT for table `core_variable_value`
--
ALTER TABLE `core_variable_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id';

--
-- AUTO_INCREMENT for table `core_website`
--
ALTER TABLE `core_website`
  MODIFY `website_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Website Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon_aggregated`
--
ALTER TABLE `coupon_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `coupon_aggregated_order`
--
ALTER TABLE `coupon_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `coupon_aggregated_updated`
--
ALTER TABLE `coupon_aggregated_updated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `cron_schedule`
--
ALTER TABLE `cron_schedule`
  MODIFY `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id';

--
-- AUTO_INCREMENT for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_entity`
--
ALTER TABLE `customer_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_flowpassword`
--
ALTER TABLE `customer_flowpassword`
  MODIFY `flowpassword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Flow password Id';

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `customer_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dataflow_batch`
--
ALTER TABLE `dataflow_batch`
  MODIFY `batch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Batch Id';

--
-- AUTO_INCREMENT for table `dataflow_batch_export`
--
ALTER TABLE `dataflow_batch_export`
  MODIFY `batch_export_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Batch Export Id';

--
-- AUTO_INCREMENT for table `dataflow_batch_import`
--
ALTER TABLE `dataflow_batch_import`
  MODIFY `batch_import_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Batch Import Id';

--
-- AUTO_INCREMENT for table `dataflow_import_data`
--
ALTER TABLE `dataflow_import_data`
  MODIFY `import_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Import Id';

--
-- AUTO_INCREMENT for table `dataflow_profile`
--
ALTER TABLE `dataflow_profile`
  MODIFY `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Profile Id', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dataflow_profile_history`
--
ALTER TABLE `dataflow_profile_history`
  MODIFY `history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'History Id', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dataflow_session`
--
ALTER TABLE `dataflow_session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Session Id';

--
-- AUTO_INCREMENT for table `design_change`
--
ALTER TABLE `design_change`
  MODIFY `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id';

--
-- AUTO_INCREMENT for table `directory_country_format`
--
ALTER TABLE `directory_country_format`
  MODIFY `country_format_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id';

--
-- AUTO_INCREMENT for table `directory_country_region`
--
ALTER TABLE `directory_country_region`
  MODIFY `region_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Region Id', AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Price ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `purchased_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  MODIFY `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  MODIFY `sample_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sample ID';

--
-- AUTO_INCREMENT for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  MODIFY `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID';

--
-- AUTO_INCREMENT for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  MODIFY `attribute_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id', AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  MODIFY `attribute_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id', AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  MODIFY `attribute_label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id';

--
-- AUTO_INCREMENT for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  MODIFY `attribute_set_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `eav_entity`
--
ALTER TABLE `eav_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  MODIFY `entity_attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id', AUTO_INCREMENT=690;

--
-- AUTO_INCREMENT for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  MODIFY `entity_store_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  MODIFY `entity_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  MODIFY `element_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Element Id', AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  MODIFY `fieldset_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  MODIFY `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type Id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gift_message`
--
ALTER TABLE `gift_message`
  MODIFY `gift_message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id';

--
-- AUTO_INCREMENT for table `importexport_importdata`
--
ALTER TABLE `importexport_importdata`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `index_event`
--
ALTER TABLE `index_event`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Id', AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `index_process`
--
ALTER TABLE `index_process`
  MODIFY `process_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Process Id', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `log_customer`
--
ALTER TABLE `log_customer`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';

--
-- AUTO_INCREMENT for table `log_summary`
--
ALTER TABLE `log_summary`
  MODIFY `summary_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Summary ID';

--
-- AUTO_INCREMENT for table `log_summary_type`
--
ALTER TABLE `log_summary_type`
  MODIFY `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log_url_info`
--
ALTER TABLE `log_url_info`
  MODIFY `url_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'URL ID';

--
-- AUTO_INCREMENT for table `log_visitor`
--
ALTER TABLE `log_visitor`
  MODIFY `visitor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID', AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `log_visitor_online`
--
ALTER TABLE `log_visitor_online`
  MODIFY `visitor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID';

--
-- AUTO_INCREMENT for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  MODIFY `problem_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Problem Id';

--
-- AUTO_INCREMENT for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  MODIFY `queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Id';

--
-- AUTO_INCREMENT for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  MODIFY `queue_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id';

--
-- AUTO_INCREMENT for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  MODIFY `subscriber_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id';

--
-- AUTO_INCREMENT for table `newsletter_template`
--
ALTER TABLE `newsletter_template`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `oauth_token`
--
ALTER TABLE `oauth_token`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  MODIFY `cert_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Cert Id';

--
-- AUTO_INCREMENT for table `paypal_payment_transaction`
--
ALTER TABLE `paypal_payment_transaction`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `paypal_settlement_report`
--
ALTER TABLE `paypal_settlement_report`
  MODIFY `report_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Report Id';

--
-- AUTO_INCREMENT for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Row Id';

--
-- AUTO_INCREMENT for table `permission_block`
--
ALTER TABLE `permission_block`
  MODIFY `block_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Block ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permission_variable`
--
ALTER TABLE `permission_variable`
  MODIFY `variable_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable ID', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `persistent_session`
--
ALTER TABLE `persistent_session`
  MODIFY `persistent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Session id';

--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `poll_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Poll Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poll_answer`
--
ALTER TABLE `poll_answer`
  MODIFY `answer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Answer Id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `poll_vote`
--
ALTER TABLE `poll_vote`
  MODIFY `vote_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Vote Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  MODIFY `alert_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id';

--
-- AUTO_INCREMENT for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  MODIFY `alert_stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id';

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rating_entity`
--
ALTER TABLE `rating_entity`
  MODIFY `entity_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rating_option`
--
ALTER TABLE `rating_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  MODIFY `vote_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Vote id';

--
-- AUTO_INCREMENT for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  MODIFY `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id';

--
-- AUTO_INCREMENT for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  MODIFY `index_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index Id';

--
-- AUTO_INCREMENT for table `report_event`
--
ALTER TABLE `report_event`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Id', AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `report_event_types`
--
ALTER TABLE `report_event_types`
  MODIFY `event_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  MODIFY `index_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index Id', AUTO_INCREMENT=984;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review id';

--
-- AUTO_INCREMENT for table `review_detail`
--
ALTER TABLE `review_detail`
  MODIFY `detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review detail id';

--
-- AUTO_INCREMENT for table `review_entity`
--
ALTER TABLE `review_entity`
  MODIFY `entity_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review entity id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  MODIFY `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id';

--
-- AUTO_INCREMENT for table `review_status`
--
ALTER TABLE `review_status`
  MODIFY `status_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Status id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salesrule`
--
ALTER TABLE `salesrule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  MODIFY `rule_customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  MODIFY `label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Label Id';

--
-- AUTO_INCREMENT for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_billing_agreement`
--
ALTER TABLE `sales_billing_agreement`
  MODIFY `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id';

--
-- AUTO_INCREMENT for table `sales_flat_creditmemo`
--
ALTER TABLE `sales_flat_creditmemo`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_flat_creditmemo_comment`
--
ALTER TABLE `sales_flat_creditmemo_comment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_flat_creditmemo_item`
--
ALTER TABLE `sales_flat_creditmemo_item`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_flat_invoice`
--
ALTER TABLE `sales_flat_invoice`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_flat_invoice_comment`
--
ALTER TABLE `sales_flat_invoice_comment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_flat_invoice_item`
--
ALTER TABLE `sales_flat_invoice_item`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_flat_order`
--
ALTER TABLE `sales_flat_order`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_flat_order_address`
--
ALTER TABLE `sales_flat_order_address`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_flat_order_item`
--
ALTER TABLE `sales_flat_order_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_flat_order_payment`
--
ALTER TABLE `sales_flat_order_payment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_flat_order_status_history`
--
ALTER TABLE `sales_flat_order_status_history`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales_flat_quote`
--
ALTER TABLE `sales_flat_quote`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sales_flat_quote_address`
--
ALTER TABLE `sales_flat_quote_address`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Id', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales_flat_quote_address_item`
--
ALTER TABLE `sales_flat_quote_address_item`
  MODIFY `address_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id';

--
-- AUTO_INCREMENT for table `sales_flat_quote_item`
--
ALTER TABLE `sales_flat_quote_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id', AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sales_flat_quote_item_option`
--
ALTER TABLE `sales_flat_quote_item_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id', AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `sales_flat_quote_payment`
--
ALTER TABLE `sales_flat_quote_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Payment Id', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_flat_quote_shipping_rate`
--
ALTER TABLE `sales_flat_quote_shipping_rate`
  MODIFY `rate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rate Id';

--
-- AUTO_INCREMENT for table `sales_flat_shipment`
--
ALTER TABLE `sales_flat_shipment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_flat_shipment_comment`
--
ALTER TABLE `sales_flat_shipment_comment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_flat_shipment_item`
--
ALTER TABLE `sales_flat_shipment_item`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_flat_shipment_track`
--
ALTER TABLE `sales_flat_shipment_track`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';

--
-- AUTO_INCREMENT for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_order_tax`
--
ALTER TABLE `sales_order_tax`
  MODIFY `tax_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Id';

--
-- AUTO_INCREMENT for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  MODIFY `tax_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id';

--
-- AUTO_INCREMENT for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id';

--
-- AUTO_INCREMENT for table `sales_recurring_profile`
--
ALTER TABLE `sales_recurring_profile`
  MODIFY `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Profile Id';

--
-- AUTO_INCREMENT for table `sales_recurring_profile_order`
--
ALTER TABLE `sales_recurring_profile_order`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Id';

--
-- AUTO_INCREMENT for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `sendfriend_log`
--
ALTER TABLE `sendfriend_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';

--
-- AUTO_INCREMENT for table `shipping_tablerate`
--
ALTER TABLE `shipping_tablerate`
  MODIFY `pk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `sitemap`
--
ALTER TABLE `sitemap`
  MODIFY `sitemap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id';

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tag Id';

--
-- AUTO_INCREMENT for table `tag_relation`
--
ALTER TABLE `tag_relation`
  MODIFY `tag_relation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tag Relation Id';

--
-- AUTO_INCREMENT for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  MODIFY `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_calculation_rate`
--
ALTER TABLE `tax_calculation_rate`
  MODIFY `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  MODIFY `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id';

--
-- AUTO_INCREMENT for table `tax_calculation_rule`
--
ALTER TABLE `tax_calculation_rule`
  MODIFY `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
  MODIFY `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';

--
-- AUTO_INCREMENT for table `weee_tax`
--
ALTER TABLE `weee_tax`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';

--
-- AUTO_INCREMENT for table `widget`
--
ALTER TABLE `widget`
  MODIFY `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Widget Id';

--
-- AUTO_INCREMENT for table `widget_instance`
--
ALTER TABLE `widget_instance`
  MODIFY `instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Instance Id', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Page Id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  MODIFY `wishlist_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id', AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_rule`
--
ALTER TABLE `admin_rule`
  ADD CONSTRAINT `FK_ADMIN_RULE_ROLE_ID_ADMIN_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api2_acl_rule`
--
ALTER TABLE `api2_acl_rule`
  ADD CONSTRAINT `FK_API2_ACL_RULE_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api2_acl_user`
--
ALTER TABLE `api2_acl_user`
  ADD CONSTRAINT `FK_API2_ACL_USER_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_API2_ACL_USER_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api_rule`
--
ALTER TABLE `api_rule`
  ADD CONSTRAINT `FK_API_RULE_ROLE_ID_API_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api_session`
--
ALTER TABLE `api_session`
  ADD CONSTRAINT `FK_API_SESSION_USER_ID_API_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD CONSTRAINT `FK_CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_status`
--
ALTER TABLE `cataloginventory_stock_status`
  ADD CONSTRAINT `FK_CATINV_STOCK_STS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_STS_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_STS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD CONSTRAINT `FK_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_group_website`
--
ALTER TABLE `catalogrule_group_website`
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_GROUP_WS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_PRD_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD CONSTRAINT `FK_CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogsearch_query`
--
ALTER TABLE `catalogsearch_query`
  ADD CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogsearch_result`
--
ALTER TABLE `catalogsearch_result`
  ADD CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY_ID_CATALOGSEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATSRCH_RESULT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_flat_store_1`
--
ALTER TABLE `catalog_category_flat_store_1`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_FLAT_STORE_1_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_FLAT_STORE_1_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product_index`
--
ALTER TABLE `catalog_category_product_index`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_IDX_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CMP_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_enabled_index`
--
ALTER TABLE `catalog_product_enabled_index`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENABLED_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_group_price`
--
ALTER TABLE `catalog_product_entity_group_price`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DF909D22C11B60B1E5E3EE64AB220ECE` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_6E08D719F0501DD1D8E6D4EFF2511C85` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_flat_1`
--
ALTER TABLE `catalog_product_flat_1`
  ADD CONSTRAINT `FK_CAT_PRD_FLAT_1_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_eav`
--
ALTER TABLE `catalog_product_index_eav`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_eav_decimal`
--
ALTER TABLE `catalog_product_index_eav_decimal`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_group_price`
--
ALTER TABLE `catalog_product_index_group_price`
  ADD CONSTRAINT `FK_195DF97C81B0BDD6A2EEC50F870E16D1` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_price`
--
ALTER TABLE `catalog_product_index_price`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_WS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD CONSTRAINT `FK_CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_PRICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_TTL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD CONSTRAINT `FK_CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_LBL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute_pricing`
--
ALTER TABLE `catalog_product_super_attribute_pricing`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRICING_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CDE8813117106CFAA3AD209358F66332` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_email_queue_recipients`
--
ALTER TABLE `core_email_queue_recipients`
  ADD CONSTRAINT `FK_6F4948F3ABF97DE12127EF14B140802A` FOREIGN KEY (`message_id`) REFERENCES `core_email_queue` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_layout_link`
--
ALTER TABLE `core_layout_link`
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_LYT_LNK_LYT_UPDATE_ID_CORE_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_store`
--
ALTER TABLE `core_store`
  ADD CONSTRAINT `FK_CORE_STORE_GROUP_ID_CORE_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_STORE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_store_group`
--
ALTER TABLE `core_store_group`
  ADD CONSTRAINT `FK_CORE_STORE_GROUP_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_translate`
--
ALTER TABLE `core_translate`
  ADD CONSTRAINT `FK_CORE_TRANSLATE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_url_rewrite`
--
ALTER TABLE `core_url_rewrite`
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT_ID_CATALOG_CATEGORY_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_variable_value`
--
ALTER TABLE `core_variable_value`
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID_CORE_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated`
--
ALTER TABLE `coupon_aggregated`
  ADD CONSTRAINT `FK_COUPON_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated_order`
--
ALTER TABLE `coupon_aggregated_order`
  ADD CONSTRAINT `FK_COUPON_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated_updated`
--
ALTER TABLE `coupon_aggregated_updated`
  ADD CONSTRAINT `FK_COUPON_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_WS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD CONSTRAINT `FK_CSTR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD CONSTRAINT `FK_CSTR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD CONSTRAINT `FK_CSTR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD CONSTRAINT `FK_CSTR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD CONSTRAINT `FK_CSTR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD CONSTRAINT `FK_CSTR_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataflow_batch`
--
ALTER TABLE `dataflow_batch`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE_ID_DATAFLOW_PROFILE_PROFILE_ID` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_batch_export`
--
ALTER TABLE `dataflow_batch_export`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH_ID_DATAFLOW_BATCH_BATCH_ID` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_batch_import`
--
ALTER TABLE `dataflow_batch_import`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH_ID_DATAFLOW_BATCH_BATCH_ID` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_import_data`
--
ALTER TABLE `dataflow_import_data`
  ADD CONSTRAINT `FK_DATAFLOW_IMPORT_DATA_SESSION_ID_DATAFLOW_SESSION_SESSION_ID` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dataflow_profile_history`
--
ALTER TABLE `dataflow_profile_history`
  ADD CONSTRAINT `FK_AEA06B0C500063D3CE6EA671AE776645` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `design_change`
--
ALTER TABLE `design_change`
  ADD CONSTRAINT `FK_DESIGN_CHANGE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD CONSTRAINT `FK_D7CFDEB379F775328EB6F62695E2B3E1` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `FK_DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DL_LNK_PURCHASED_ORDER_ID_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_46CC8E252307CE62F00A8F1887512A39` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B219BF25756700DEE44550B21220ECCE` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD CONSTRAINT `FK_DL_SAMPLE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD CONSTRAINT `FK_DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `FK_EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD CONSTRAINT `FK_EAV_ATTR_SET_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD CONSTRAINT `FK_EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD CONSTRAINT `FK_EAV_ENTITY_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_STORE_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `index_process_event`
--
ALTER TABLE `index_process_event`
  ADD CONSTRAINT `FK_INDEX_PROCESS_EVENT_EVENT_ID_INDEX_EVENT_EVENT_ID` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_INDEX_PROCESS_EVENT_PROCESS_ID_INDEX_PROCESS_PROCESS_ID` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD CONSTRAINT `FK_NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD CONSTRAINT `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  ADD CONSTRAINT `FK_PAYPAL_CERT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  ADD CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD CONSTRAINT `FK_PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PERSISTENT_SESSION_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `poll`
--
ALTER TABLE `poll`
  ADD CONSTRAINT `FK_POLL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD CONSTRAINT `FK_POLL_ANSWER_POLL_ID_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_store`
--
ALTER TABLE `poll_store`
  ADD CONSTRAINT `FK_POLL_STORE_POLL_ID_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POLL_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD CONSTRAINT `FK_POLL_VOTE_POLL_ANSWER_ID_POLL_ANSWER_ANSWER_ID` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD CONSTRAINT `FK_PRD_ALERT_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD CONSTRAINT `FK_PRD_ALERT_STOCK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD CONSTRAINT `FK_RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD CONSTRAINT `FK_RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RATING_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD CONSTRAINT `FK_RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report_event`
--
ALTER TABLE `report_event`
  ADD CONSTRAINT `FK_REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_EVENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_store`
--
ALTER TABLE `review_store`
  ADD CONSTRAINT `FK_REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD CONSTRAINT `FK_SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD CONSTRAINT `FK_SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD CONSTRAINT `FK_SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_billing_agreement`
--
ALTER TABLE `sales_billing_agreement`
  ADD CONSTRAINT `FK_SALES_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BILLING_AGREEMENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_billing_agreement_order`
--
ALTER TABLE `sales_billing_agreement_order`
  ADD CONSTRAINT `FK_SALES_BILLING_AGRT_ORDER_AGRT_ID_SALES_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BILLING_AGRT_ORDER_ORDER_ID_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo`
--
ALTER TABLE `sales_flat_creditmemo`
  ADD CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo_comment`
--
ALTER TABLE `sales_flat_creditmemo_comment`
  ADD CONSTRAINT `FK_B0FCB0B5467075BE63D474F2CD5F7804` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo_grid`
--
ALTER TABLE `sales_flat_creditmemo_grid`
  ADD CONSTRAINT `FK_78C711B225167A11CC077B03D1C8E1CC` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_creditmemo_item`
--
ALTER TABLE `sales_flat_creditmemo_item`
  ADD CONSTRAINT `FK_306DAC836C699F0B5E13BE486557AC8A` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice`
--
ALTER TABLE `sales_flat_invoice`
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice_comment`
--
ALTER TABLE `sales_flat_invoice_comment`
  ADD CONSTRAINT `FK_5C4B36BBE5231A76AB8018B281ED50BC` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice_grid`
--
ALTER TABLE `sales_flat_invoice_grid`
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_ENTT_ID_SALES_FLAT_INVOICE_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_invoice_item`
--
ALTER TABLE `sales_flat_invoice_item`
  ADD CONSTRAINT `FK_SALES_FLAT_INVOICE_ITEM_PARENT_ID_SALES_FLAT_INVOICE_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order`
--
ALTER TABLE `sales_flat_order`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_address`
--
ALTER TABLE `sales_flat_order_address`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_ADDRESS_PARENT_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_grid`
--
ALTER TABLE `sales_flat_order_grid`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_ENTITY_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_item`
--
ALTER TABLE `sales_flat_order_item`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_payment`
--
ALTER TABLE `sales_flat_order_payment`
  ADD CONSTRAINT `FK_SALES_FLAT_ORDER_PAYMENT_PARENT_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_status_history`
--
ALTER TABLE `sales_flat_order_status_history`
  ADD CONSTRAINT `FK_CE7C71E74CB74DDACED337CEE6753D5E` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote`
--
ALTER TABLE `sales_flat_quote`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_address`
--
ALTER TABLE `sales_flat_quote_address`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_address_item`
--
ALTER TABLE `sales_flat_quote_address_item`
  ADD CONSTRAINT `FK_2EF8E28181D666D94D4E30DC2B0F80BF` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_A345FC758F20C314169CE27DCE53477F` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B521389746C00700D1B2B76EBBE53854` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_item`
--
ALTER TABLE `sales_flat_quote_item`
  ADD CONSTRAINT `FK_B201DEB5DE51B791AF5C5BF87053C5A7` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_item_option`
--
ALTER TABLE `sales_flat_quote_item_option`
  ADD CONSTRAINT `FK_5F20E478CA64B6891EA8A9D6C2735739` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_payment`
--
ALTER TABLE `sales_flat_quote_payment`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_shipping_rate`
--
ALTER TABLE `sales_flat_quote_shipping_rate`
  ADD CONSTRAINT `FK_B1F177EFB73D3EDF5322BA64AC48D150` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment`
--
ALTER TABLE `sales_flat_shipment`
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_comment`
--
ALTER TABLE `sales_flat_shipment_comment`
  ADD CONSTRAINT `FK_C2D69CC1FB03D2B2B794B0439F6650CF` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_grid`
--
ALTER TABLE `sales_flat_shipment_grid`
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_ENTT_ID_SALES_FLAT_SHIPMENT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_item`
--
ALTER TABLE `sales_flat_shipment_item`
  ADD CONSTRAINT `FK_3AECE5007D18F159231B87E8306FC02A` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_shipment_track`
--
ALTER TABLE `sales_flat_shipment_track`
  ADD CONSTRAINT `FK_BCD2FA28717D29F37E10A153E6F2F841` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_FLAT_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DA51A10B2405B64A4DAEF77A64F0DAAD` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_recurring_profile`
--
ALTER TABLE `sales_recurring_profile`
  ADD CONSTRAINT `FK_SALES_RECURRING_PROFILE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_RECURRING_PROFILE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_recurring_profile_order`
--
ALTER TABLE `sales_recurring_profile_order`
  ADD CONSTRAINT `FK_7FF85741C66DCD37A4FBE3E3255A5A01` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B8A7A5397B67455786E55461748C59F4` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD CONSTRAINT `FK_SITEMAP_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `FK_TAG_FIRST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`first_customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TAG_FIRST_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`first_store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `tag_properties`
--
ALTER TABLE `tag_properties`
  ADD CONSTRAINT `FK_TAG_PROPERTIES_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_PROPERTIES_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_relation`
--
ALTER TABLE `tag_relation`
  ADD CONSTRAINT `FK_TAG_RELATION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_summary`
--
ALTER TABLE `tag_summary`
  ADD CONSTRAINT `FK_TAG_SUMMARY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_SUMMARY_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD CONSTRAINT `FK_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_discount`
--
ALTER TABLE `weee_discount`
  ADD CONSTRAINT `FK_WEEE_DISCOUNT_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_DISCOUNT_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_DISCOUNT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD CONSTRAINT `FK_0A5D06DCEC6A6845F50E5FAAC5A1C96D` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_LYT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FK_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
