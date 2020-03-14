-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2020 at 03:59 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `0TYcMSgHOp`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'public/images/imagenotfound.png',
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `title`, `description`, `website`, `image_url`, `link_url`, `view_count`) VALUES
(1, 'Getting to the Bottom of Navigation in Flutter', 'Bottom navigation in mobile apps is popular because our phones keep getting bigger but our thumbs do not. The Material Design specification describes a bottom navigation bar as a row of three to five buttons at the', '', 'https://miro.medium.com/max/1524/1*pzfLG6bpSs8KGe48AXZR_g.png', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 9),
(2, 'Party Makeup', 'Who doesn\'t enjoy getting dolled up for a party? It\'s a great opportunity to go all out and look your absolute best! You can stun them with some wild and flashy makeup, adding sparkles and bold colors that are just perfect for parties.', '', 'https://www.beautytipsonline.com/images/eye-makeup.jpg', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 6),
(3, 'One of the World’s Most Dangerous Spiders Could Invade Homes after Australia\'s Recent Rainfall', 'While recent rainfall has been a welcome change in Australia after destructive bushfires caused a widespread crisis, it hasn’t come without an asterisk. According to the Australian Reptile Park, the wet and warm conditions have made Sydney funnel web spiders highly active—and the funnel', '', 'https://images2.minutemediacdn.com/image/upload/c_crop,h_1124,w_2000,x_0,y_67/f_auto,q_auto,w_1100/v1579797307/shape/mentalfloss/613403-ianwaldie-gettyimages-56714645.jp}g', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 7),
(4, '5 Mistakes That Could Ruin Your Content Marketing Campaign', 'However, making it work is not easy. Some businesses fail because of silly mistakes such as misconceptions about what content marketing really is and isn’t. For example, they think of content marketing as something that doesn’t require a lot of investments and ultimately fail because of boring, mediocre content.', '', 'https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMDk2Mn0', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 2),
(5, 'What\'s the Best Way to Leash Your Dog?', 'Awe ... You got a puppy. Bet you\'re looking forward to lots of fun days playing with her, taking walks. Feeding her, teaching her to roll over, taking walks. Cuddling on the couch with her and, yes, taking walks. Are you sensing a theme?', '', 'https://resize.hswstatic.com/w_907/gif/dog-leash.jpg', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 7),
(6, 'India’s economy risks swapping stagnation for stagflation', 'The hawkers had some plausible excuses. The weather has been erratic, and delivery systems unreliable. But although an increase in inflation was widely foreseen, the severity of it was not. Consumer prices rose by over 7.3% i', '', 'public/images/imagenotfound.png', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 2),
(129, 'PHP', '\nsince version 7.0:\nPHP is a popular general-purpose scripting language that is especially suited to web development[5]. It was originally created by Rasmus Lerdorf in 1994;[6] the PHP reference implementation is now produced by The PHP Group.[7] PHP originally stood for Personal Home Page,[6] but it now stands for the recursive initialism PHP: Hypertext Preprocessor.[8]\nPHP code is usually processed on a web server by a PHP interpreter implemented as a module, a daemon or as a Common Gateway In', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/100px-PHP-logo.svg.png', 'https://en.wikipedia.org/wiki/php', 1),
(130, 'Rasmus Lerdorf', 'Rasmus Lerdorf (born 22 November 1968) is a Danish-Canadian[1] programmer. He co-authored and inspired the PHP scripting language, authoring the first two versions of the language and participating in the development of later versions led by a group of developers including Jim Winstead (who later created blo.gs), Stig Bakken, Shane Caraveo, Andi Gutmans, and Zeev Suraski. He continues to contribute to the project.\nLerdorf was born on Disko Island in Greenland and moved to Denmark in his early ye', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/6/66/Rasmus_Lerdorf_August_2014_%28cropped%29.JPG/220px-Rasmus_Lerdorf_August_2014_%28cropped%29.JPG', 'https://en.wikipedia.org/wiki/Rasmus_Lerdorf', 2),
(131, 'Zend Technologies', 'Zend Technologies Ltd. is a world wide web infrastructure software company with headquarters in Cupertino, California, U.S., a technology center in Ramat Gan, Tel Aviv, Israel and offices in France, Italy and Germany. The company\'s operations are currently centered on the development of products relating to the development, deployment and management of PHP-based web applications, including Zend Studio.\nZend Technologies was founded by Andi Gutmans and Zeev Suraski who, along with other Israeli g', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Zend_Technologies_Logo.svg/220px-Zend_Technologies_Logo.svg.png', 'https://en.wikipedia.org/wiki/Zend_Technologies', 0),
(132, 'Zend Engine', '\nThe Zend Engine is the open source scripting engine that interprets the PHP programming language.  It was originally developed by Andi Gutmans and Zeev Suraski while they were students at the Technion – Israel Institute of Technology.  They later founded a company called Zend Technologies in Ramat Gan, Israel. The name Zend is a combination of their forenames, Zeev and Andi.\nThe first version of the Zend Engine appeared in 1999 in PHP version 4.[1] It was written in C as a highly optimized modu', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/d/d2/Zend_Engine_logo.png/220px-Zend_Engine_logo.png', 'https://en.wikipedia.org/wiki/Zend_Engine', 0),
(133, 'Parrot virtual machine', 'Parrot is a register-based process virtual machine designed to run dynamic languages efficiently. It is possible to compile Parrot assembly language and Parrot intermediate representation (PIR, an intermediate language) to Parrot bytecode and execute it. Parrot is free and open source software.[2]\nParrot was started by the Perl community and is developed with help from the open source and free software communities. As a result, it is focused on license compatibility with Perl (Artistic License 2', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/10px-OOjs_UI_icon_edit-ltr-progressive.svg.png', 'https://en.wikipedia.org/wiki/Parrot_virtual_machine', 1),
(134, 'Phalanger (compiler)', 'Phalanger is a compiler front end for compiling PHP source code into CIL byte-code, which can be further processed by the .NET Framework\'s just-in-time compiler. The project was started at Charles University and is supported by Microsoft. Phalanger was discontinued in favor of the more modern PeachPie compiler, which utilizes the Roslyn API.\nPhalanger can run real-world PHP applications, many with minor to no modifications. Examples include WordPress,[1] phpMyAdmin and phpBB.[2]\nOne of the main ', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/10px-OOjs_UI_icon_edit-ltr-progressive.svg.png', 'https://en.wikipedia.org/wiki/Phalanger_(compiler)', 2),
(135, 'HHVM', '\nHipHop Virtual Machine (HHVM) is an open-source virtual machine based on just-in-time (JIT) compilation that serves as an execution engine for the Hack programming language and used to support PHP execution before the release of HHVM version 4.[7] By using the principle of JIT compilation, Hack code is first transformed into intermediate HipHop bytecode (HHBC), which is then dynamically translated into x86-64 machine code, optimized, and natively executed.[8][9]  This contrasts with PHP\'s usual', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/c/cf/HHVM_logo.svg/100px-HHVM_logo.svg.png', 'https://en.wikipedia.org/wiki/HHVM', 0),
(136, 'Hack (programming language)', 'Hack is a programming language for the HipHop Virtual Machine (HHVM), created by Facebook as a dialect of PHP. The language implementation is open-source, licensed under the MIT License.[2][3][4]\nHack allows programmers to use both dynamic typing and static typing.  This kind of a type system is called gradual typing, which is also implemented in other programming languages such as ActionScript.[5]  Hack\'s type system allows types to be specified for function arguments, function return values, a', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Hack_%28programming_language%29_logo.svg/75px-Hack_%28programming_language%29_logo.svg.png', 'https://en.wikipedia.org/wiki/Hack_(programming_language)', 0),
(137, 'Tcl', 'Tcl (pronounced \"tickle\" or tee cee ell /ˈtiː siː ɛl/[6]) is a high-level, general-purpose, interpreted, dynamic programming language. It was designed with the goal of being very simple but powerful.[7] Tcl casts everything into the mold of a command, even programming constructs like variable assignment and procedure definition.[8] Tcl supports multiple programming paradigms, including object-oriented, imperative and functional programming or procedural styles.\nIt is commonly used embedded into ', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Tcl-powered.svg/70px-Tcl-powered.svg.png', 'https://en.wikipedia.org/wiki/Tcl', 0),
(138, 'C (programming language)', 'C (/siː/, as in the letter c) is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, while a static type system prevents unintended operations. By design, C provides constructs that map efficiently to typical machine instructions and has found lasting use in applications previously coded in assembly language. Such applications include operating systems and various application software for computers, from supercompu', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/3/35/The_C_Programming_Language_logo.svg/140px-The_C_Programming_Language_logo.svg.png', 'https://en.wikipedia.org/wiki/C_(programming_language)', 0),
(139, 'C++', '\n\nC++ (/ˌsiːˌplʌsˈplʌs/) is a high-level, general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or \"C with Classes\". The language has expanded significantly over time, and modern C++ has object-oriented, generic, and functional features in addition to facilities for low-level memory manipulation. It is almost always implemented as a compiled language, and many vendors provide C++ compilers, including the Free Software Foundation, LLVM, M', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/150px-ISO_C%2B%2B_Logo.svg.png', 'https://en.wikipedia.org/wiki/C%2B%2B', 0),
(140, 'Free software', 'Free software or libre software[1][2] is computer software distributed under terms that allow users to run the software for any purpose as well as to study, change, and distribute it and any adapted versions.[3][4][5][6][7] Free software is a matter of liberty, not price: users—individually or in cooperation with computer programmers—are free to do what they want with their copies of a free software (including profiting from them) regardless of how much is paid to obtain the program.[8][2] Compu', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/7/70/Titan_supercomputer_at_the_Oak_Ridge_National_Laboratory.jpg/250px-Titan_supercomputer_at_the_Oak_Ridge_National_Laboratory.jpg', 'https://en.wikipedia.org/wiki/Free_software', 0),
(141, 'JavaScript', '\nJavaScript (/ˈdʒɑːvəˌskrɪpt/),[6] often abbreviated as JS, is a programming language that conforms to the ECMAScript specification.[7] JavaScript is high-level, often just-in-time compiled, and multi-paradigm. It has curly-bracket syntax, dynamic typing, prototype-based object-orientation, and first-class functions.\nAlongside HTML and CSS, JavaScript is one of the core technologies of the World Wide Web.[8] JavaScript enables interactive web pages and is an essential part of web applications. T', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikibooks-logo-en-noslogan.svg/16px-Wikibooks-logo-en-noslogan.svg.png', 'https://en.wikipedia.org/wiki/JavaScript', 0),
(142, 'Perl', '\n\nPerl is a family of two high-level, general-purpose, interpreted, dynamic programming languages. \"Perl\" refers to Perl 5, but from 2000 to 2019 it also referred to its redesigned \"sister language\", Perl 6, before the latter\'s name was officially changed to Raku in October 2019.[8][9]\nThough Perl is not officially an acronym,[10] there are various backronyms in use, including \"Practical Extraction and Reporting Language\".[11] Perl was originally developed by Larry Wall in 1987 as a general-purp', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/e/e0/Programming-republic-of-perl.png', 'https://en.wikipedia.org/wiki/Perl', 0),
(143, 'Java (programming language)', '\nJava is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible. It is intended to let application developers write once, run anywhere (WORA),[15] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[16] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architectu', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/141px-Java_programming_language_logo.svg.png', 'https://en.wikipedia.org/wiki/Java_(programming_language)', 0),
(144, 'Microsoft Windows', '\n\nMicrosoft Windows, commonly referred to as Windows, is a group of several proprietary graphical operating system families, all of which are developed and marketed by Microsoft. Each family caters to a certain sector of the computing industry. Active Microsoft Windows families include Windows NT and Windows IoT; these may encompass subfamilies, e.g. Windows Server or Windows Embedded Compact (Windows CE). Defunct Microsoft Windows families include Windows 9x, Windows Mobile and Windows Phone.\nM', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Windows_darkblue_2012.svg/250px-Windows_darkblue_2012.svg.png', 'https://en.wikipedia.org/wiki/Windows', 0),
(145, 'Ramat Gan', '\nRamat Gan (Hebrew: רָמַת גַּן or רָמַת־גַּן) is a city in the Tel Aviv District of Israel, located east of the municipality of Tel Aviv and part of the Tel Aviv metropolitan area. It is home to one of the world\'s major diamond exchanges, and many high-tech industries.\nRamat Gan was established in 1921 as a moshav, a communal farming settlement. In 2018 it had a population of 159,159.[1] The mayor of Ramat Gan is Carmel Shama.\nRamat Gan was established by the Ir Ganim[2] association in 1921 as a', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/d/d2/View_Of_Ramat_Gan_Diamond_Exchange_District.jpg/300px-View_Of_Ramat_Gan_Diamond_Exchange_District.jpg', 'https://en.wikipedia.org/wiki/Ramat_Gan', 0),
(146, 'International Components for Unicode', 'International Components for Unicode (ICU) is an open-source project of mature C/C++ and Java libraries for Unicode support, software internationalization, and software globalization. ICU is widely portable to many operating systems and environments. It gives applications the same results on all platforms and between C, C++, and Java software. The ICU project is a technical committee of the Unicode Consortium and sponsored, supported, and used by IBM and many other companies.[2]\nICU provides the', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/10px-OOjs_UI_icon_edit-ltr-progressive.svg.png', 'https://en.wikipedia.org/wiki/International_Components_for_Unicode', 0),
(147, 'WordPress', '\n\nWordPress (WordPress.org) is a free and open-source content management system (CMS) written in PHP[4] and paired with a MySQL or MariaDB database. Features include a plugin architecture and a template system, referred to within WordPress as Themes. WordPress was originally created as a blog-publishing system but has evolved to support other types of web content including more traditional mailing lists and forums, media galleries, membership sites, learning management systems (LMS) and online s', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/2/20/WordPress_logo.svg/240px-WordPress_logo.svg.png', 'https://en.wikipedia.org/wiki/WordPress', 0),
(148, 'Debian', '\n\nDebian (/ˈdɛbiən/),[4][5] also known as Debian GNU/Linux, is a Linux distribution composed of free and open-source software, developed by the community-supported Debian Project, which was established by Ian Murdock on August 16, 1993. The first version, Debian 0.01, was released on September 15, 1993,[6] and the first stable version, 1.1, was released on June 17, 1996.[7] The Debian Stable branch is the most popular edition for personal computers and servers, and is the basis for many other di', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Debian-OpenLogo.svg/100px-Debian-OpenLogo.svg.png', 'https://en.wikipedia.org/wiki/Debian', 0),
(149, 'Internet Information Services', '\nInternet Information Services (IIS, formerly Internet Information Server) is an extensible web server created by Microsoft for use with the Windows NT family.[2] IIS supports HTTP, HTTP/2, HTTPS, FTP, FTPS, SMTP and NNTP.  It has been an integral part of the Windows NT family since Windows NT 4.0, though it may be absent from some editions (e.g. Windows XP Home edition), and is not active by default.\nThe first Microsoft web server was a research project at the European Microsoft Windows NT Acad', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/2/21/IIS_8.5.9431_management_console.png/300px-IIS_8.5.9431_management_console.png', 'https://en.wikipedia.org/wiki/Internet_Information_Services', 0),
(150, 'UTF-16', 'UTF-16 (16-bit Unicode Transformation Format) is a character encoding capable of encoding all 1,112,064 valid code points of Unicode (in fact this number of code points is dictated by the design of UTF-16). The encoding is variable-length, as code points are encoded with one or two 16-bit code units. UTF-16 arose from an earlier fixed-width 16-bit encoding known as UCS-2 (for 2-byte Universal Character Set) once it became clear that more than 216 (65536) code points were needed.[1]\nUTF-16 is use', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/0/01/Unifont_Full_Map.png/250px-Unifont_Full_Map.png', 'https://en.wikipedia.org/wiki/UTF-16', 0),
(151, 'Microsoft Windows', '\n\nMicrosoft Windows, commonly referred to as Windows, is a group of several proprietary graphical operating system families, all of which are developed and marketed by Microsoft. Each family caters to a certain sector of the computing industry. Active Microsoft Windows families include Windows NT and Windows IoT; these may encompass subfamilies, e.g. Windows Server or Windows Embedded Compact (Windows CE). Defunct Microsoft Windows families include Windows 9x, Windows Mobile and Windows Phone.\nM', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Windows_darkblue_2012.svg/250px-Windows_darkblue_2012.svg.png', 'https://en.wikipedia.org/wiki/Microsoft_Windows', 0),
(152, 'JSON', 'JavaScript Object Notation (JSON, pronounced /ˈdʒeɪsən/; also /ˈdʒeɪˌsɒn/[note 1]) \nis an open standard file format, and data interchange format, that uses human-readable text to store and transmit data objects consisting of attribute–value pairs and array data types (or any other serializable value). It is a very common data format, with a diverse range of applications, such as serving as replacement for XML in AJAX systems.[6]\nJSON is a language-independent data format. It was derived from Jav', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/c/c9/JSON_vector_logo.svg/160px-JSON_vector_logo.svg.png', 'https://en.wikipedia.org/wiki/JSON', 0),
(153, 'Unicode', '\nUnicode is a information technology standard for the consistent encoding, representation, and handling of text expressed in most of the world\'s writing systems. The standard is maintained by the Unicode Consortium, and as of March 2020[update] the most recent version, Unicode 13.0, contains a repertoire of 143,924[1] characters (consisting of 143,696 graphic characters, 163 format characters and 65 control characters) covering 154 modern and historic scripts, as well as multiple symbol sets and', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/0/09/New_Unicode_logo.svg/250px-New_Unicode_logo.svg.png', 'https://en.wikipedia.org/wiki/Unicode', 0),
(154, 'MySQL', '\nMySQL (/ˌmaɪˌɛsˌkjuːˈɛl/ \"My S-Q-L\")[5] is an open-source relational database management system (RDBMS).[6]  Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter,[7] and \"SQL\", the abbreviation for Structured Query Language.\nMySQL is free and open-source software under the terms of the GNU General Public License, and is also available under a variety of proprietary licenses. MySQL was owned and sponsored by the Swedish company MySQL AB, which was bought by Sun M', 'Wikipedia', 'upload.wikimedia.org/wikipedia/en/thumb/6/62/MySQL.svg/136px-MySQL.svg.png', 'https://en.wikipedia.org/wiki/MySQL', 0),
(155, 'File:En-PHP.ogg', 'This is  a spoken word version of the Wikipedia article: PHPListen to this article (audio help)    \nSpeaker: Mangst\n \nhttps://creativecommons.org/licenses/by-sa/3.0\nCC BY-SA 3.0 \nCreative Commons Attribution-Share Alike 3.0 \ntruetrue\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:En-PHP.ogg', 0),
(156, 'PHP License', '[4]The PHP License is the software license under which the PHP scripting language is released. The PHP License is designed to encourage widespread adoption of the source code. Redistribution is permitted in source or binary form with or without modifications, with some caveats.\nVersion 3 of PHP used a dual license—PHP 3\'s source is available under either the PHP License or the GNU General Public License (GPL). This practice was discontinued as of PHP 4, with PHP\'s developers citing the restricti', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/PHP_License', 0),
(157, 'Unix-like', '\nA Unix-like (sometimes referred to as UN*X or *nix) operating system is one that behaves in a manner similar to a Unix system, while not necessarily conforming to or being certified to any version of the Single UNIX Specification.  A Unix-like application is one that behaves like the corresponding Unix command or shell. There is no standard for defining the term, and some difference of opinion is possible as to the degree to which a given operating system or application is \"Unix-like\".\nThe term', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Unix-like', 0),
(158, 'PHP License', '[4]The PHP License is the software license under which the PHP scripting language is released. The PHP License is designed to encourage widespread adoption of the source code. Redistribution is permitted in source or binary form with or without modifications, with some caveats.\nVersion 3 of PHP used a dual license—PHP 3\'s source is available under either the PHP License or the GNU General Public License (GPL). This practice was discontinued as of PHP 4, with PHP\'s developers citing the restricti', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Zend_Engine_License', 0),
(159, 'Programming language implementation', 'A programming language implementation is a system for executing computer programs.\nThere are two general approaches to programming language implementation:\nNotice that a compiler does not directly execute the program. Ultimately, in order to execute a program via compilation, it must be translated into a form that can serve as input to an interpreter or directly to hardware.\nWhen a piece of computer hardware can interpret a programming language directly, that language is called machine code. A s', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Programming_language_implementation', 0),
(160, 'Filename extension', 'A filename extension is an identifier specified as a suffix to the name of a computer file. The extension indicates a characteristic of the file contents or its intended use. A filename extension is typically delimited from the filename with a full stop (period), but in some systems it is separated with spaces.\nSome file systems implement filename extensions as a feature of the file system itself and may limit the length and format of the extension, while others treat filename extensions as part', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Filename_extension', 0),
(161, 'Software license', 'A software license is a legal instrument (usually by way of contract law, with or without printed material) governing the use or redistribution of software. Under United States copyright law, all software is copyright protected, in both source code and object code forms, unless that software was developed by the United States Government, in which case it cannot be copyrighted.[1] Authors of copyrighted software can donate their software to the public domain, in which case it is also not covered ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Software_license', 0),
(162, 'File:PHP-logo.svg', 'Main color:\nGradient on the outside:\nCor principal:\nCor do gradiente externo:\n \nWikimedia Foundation has received an e-mail confirming that the copyright holder has approved publication under the terms mentioned on this page. This correspondence has been reviewed by an OTRS member and stored in our permission archive. The correspondence is available to trusted volunteers as ticket #2016060210016939.\nTicket link: https://ticket.wikimedia.org/otrs/index.pl?Action=AgentTicketZoom&TicketNumber=20160', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:PHP-logo.svg', 0),
(163, 'Strong and weak typing', 'In computer programming, programming languages are often colloquially classified as to whether the language\'s type system makes it strongly typed or weakly typed (loosely typed). \nGenerally, a strongly typed language has stricter typing rules at compile time, which implies that errors and exceptions are more likely to happen during compilation. Dynamically typed languages (where type checking happens at run time) can also be strongly typed. Most of these rules affect variable assignment, return ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Weak_typing', 0),
(164, 'Resin (software)', 'Resin is a web server and Java application server from Caucho Technology. In addition to Resin (GPL), Resin Pro is available for enterprise and production environments with a license. Resin supports the Java EE standard[2] as well as a mod_php/PHP like engine called Quercus.[3]\nWhile Resin (GPL) is free for use in production, Resin Pro includes optimizations such as:\nAlthough a Java-based server, key pieces of Resin\'s core networking are written in highly optimized C. Caucho states Java is the l', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Quercus_(software)', 0),
(165, 'Reflection (computer programming)', 'In computer science, reflection is the ability of a process to examine, introspect, and modify its own structure and behavior.[1]\nThe earliest computers were programmed in their native assembly language, which were inherently reflective, as these original architectures could be programmed by defining instructions as data and using self-modifying code. As programming moved to compiled higher-level languages such as Algol, Cobol, and Fortran (but also Pascal and C and many other languages), this r', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Reflective_programming', 0),
(166, 'Reference implementation', 'In the software development process,  a reference implementation (or, less frequently, sample implementation or model implementation) is the standard from which all other implementations and corresponding customizations are derived. A reference implementation often accompanies a technical standard, and demonstrates what should be considered the \"correct\" behavior of any other implementation of it.\nReference implementations of algorithms, for instance cryptographic algorithms, are often the resul', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Reference_implementation', 0),
(167, 'Programmer', '\nA computer programmer, sometimes called more recently a coder (especially in more informal contexts), is a person who creates computer software. The term computer programmer can refer to a specialist in one area of computers, or to a generalist who writes code for many kinds of software.\nA programmer\'s most oft-used computer language (e.g., Assembly, COBOL, C, C++, C#, JavaScript, Lisp, Python) may be prefixed to the term programmer. Some who work with web programming languages also prefix thei', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Software_developer', 0),
(168, 'File:Wikibooks-logo-en-noslogan.svg', ' \nhttps://creativecommons.org/licenses/by-sa/3.0\nCC BY-SA 3.0 \nCreative Commons Attribution-Share Alike 3.0 \ntruetrue\nThis tag does not indicate the copyright status of the attached work. A normal copyright tag is still required. See Commons:Licensing. \nAlemannisch | беларуская (тарашкевіца)‎ | বাংলা | čeština | Deutsch | English | español | euskara | فارسی | français | galego | עברית | हिन्दी | italiano | 日本語 | 한국어 | македонски | മലയാളം | Bahasa Melayu | नेपाली | Nederlands | polski | پښتو | po', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:Wikibooks-logo-en-noslogan.svg', 0),
(169, 'PHP (disambiguation)', 'PHP is an open-source server-side scripting language.\nPHP may also refer to:\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/PHP_(disambiguation)', 0),
(170, 'Procedural programming', 'Procedural programming is a programming paradigm, derived from structured programming,[citation needed] based on the concept of the procedure call.  Procedures, also known as routines, subroutines, or functions, simply contain a series of computational steps to be carried out.  Any given procedure might be called at any point during a program\'s execution, including by other procedures or itself. The first major procedural programming languages appeared circa 1957–1964, including Fortran, ALGOL, ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Procedural_programming', 0),
(171, 'Software design', 'Software design is the process by which an agent creates a specification of a software artifact, intended to accomplish goals, using a set of primitive components and subject to constraints.[1] Software design may refer to either \"all the activity involved in conceptualizing, framing, implementing, commissioning, and ultimately modifying complex systems\" or \"the activity following requirements specification and before programming, as ... [in] a stylized software engineering process.\"[2]\nSoftware', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Software_design', 0),
(172, 'Programming paradigm', 'Programming paradigms are a way to classify programming languages based on their features. Languages can be classified into multiple paradigms.\nSome paradigms are concerned mainly with implications for the execution model of the language, such as allowing side effects, or whether the sequence of operations is defined by the execution model.  Other paradigms are concerned mainly with the way that code is organized, such as grouping a code into units along with the state that is modified by the co', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Programming_paradigm', 0),
(173, 'Imperative programming', 'In computer science, imperative programming is a  programming paradigm that uses statements that change a program\'s state. In much the same way that the imperative mood in natural languages expresses commands, an imperative program consists of commands for the computer to perform. Imperative programming focuses on describing how a program operates.\nThe term is often used in contrast to declarative programming, which focuses on what the program should accomplish without specifying how the program', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Imperative_programming', 0),
(174, 'Recursive acronym', 'A recursive acronym is an acronym that refers to itself. The term was first used in print in 1979 in Douglas Hofstadter\'s book Gödel, Escher, Bach: An Eternal Golden Braid, in which Hofstadter invents the acronym GOD, meaning \"GOD Over Djinn\", to help explain infinite series, and describes it as a recursive acronym.[1] Other references followed,[2] however the concept was used as early as 1968 in John Brunner\'s science fiction novel Stand on Zanzibar. In the story, the acronym EPT (Education for', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Recursive_initialism', 0),
(175, 'Daemon (computing)', 'In multitasking computer operating systems, a daemon (/ˈdiːmən/ or /ˈdeɪmən/)[1] is a computer program that runs as a background process, rather than being under the direct control of an interactive user. Traditionally, the process names of a daemon end with the letter d, for clarification that the process is in fact a daemon, and for differentiation between a daemon and a normal computer program. For example, syslogd is a daemon that implements system logging facility, and sshd is a daemon that', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Daemon_(computing)', 0),
(176, 'Content management system', 'A content management system (CMS)[1][2][3] is a software application that can be used to manage the creation and modification of digital content. CMSs are typically used for enterprise content management (ECM) and web content management (WCM). ECM typically supports multiple users in a collaborative environment[4] by integrating document management, digital asset management and record retention.[5] Alternatively, WCM is the collaborative authoring for websites and may include text and embed grap', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Content_management_system', 0),
(177, 'Gradual typing', 'Gradual typing is a type system in which some variables and expressions may be given types and the correctness of the typing is checked at compile-time (which is static typing) and some expressions may be left untyped and eventual type errors are reported at run-time (which is dynamic typing). Gradual typing allows software developers to choose either type paradigm as appropriate, from within a single language.[1] In many cases gradual typing is added to an existing dynamic language, creating a ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Gradual_typing', 0),
(178, 'Software release life cycle', '\nA software release life cycle is the sum of the stages of development and maturity for a piece of computer software. Cycles range from its initial development to its eventual release, and include updated versions of the released version to help improve software or fix software bugs still present in the software.\nComputer users are most likely to be familiar with the release cycle beta as software products are sometimes publicly advertised as being beta in order to reduce users\' expectations of ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Software_release_life_cycle', 0),
(179, 'Plug-in (computing)', 'In computing, a plug-in (or plugin, add-in, addin, add-on, or addon) is a software component that adds a specific feature to an existing computer program. When a program supports plug-ins, it enables customization.\nWeb browsers have historically allowed executables as plug-ins, though they are now mostly deprecated, which are a different type of software module than browser extensions. Two plug-in examples are the Adobe Flash Player for playing Adobe Flash content and a Java virtual machine for ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Plugin_(computing)', 0),
(180, 'Formal specification', 'In computer science, formal specifications are mathematically based techniques whose purpose are to help with the implementation of systems and software. They are used to describe a system, to analyze its behavior, and to aid in its design by verifying key properties of interest through rigorous and effective reasoning tools.[1][2] These specifications are formal in the sense that they have a syntax, their semantics fall within one domain, and they are able to be used to infer useful information', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Formal_specification', 0),
(181, 'File:Rasmus Lerdorf cropped.jpg', '\n \n \nhttps://creativecommons.org/licenses/by-sa/2.0\nCC BY-SA 2.0 \nCreative Commons Attribution-Share Alike 2.0 \ntruetrue\nThis image is a derivative work of the following images:\nUploaded with derivativeFX\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:Rasmus_Lerdorf_cropped.jpg', 0),
(182, 'File:Zeev Suraski 2005 cropped.jpg', '\n \n \nhttps://creativecommons.org/licenses/by-sa/2.0\nCC BY-SA 2.0 \nCreative Commons Attribution-Share Alike 2.0 \ntruetrue\nThis image is a derivative work of the following images:\nUploaded with derivativeFX\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:Zeev_Suraski_2005_cropped.jpg', 0),
(183, 'Common Gateway Interface', 'In computing, Common Gateway Interface (CGI) is an interface specification for web servers to execute programs that execute like console applications (also called command-line interface programs) running on a server that generates web pages dynamically. Such programs are known as CGI scripts or simply as CGIs. The specifics of how the script is executed by the server are determined by the server.  In the common case, a CGI script executes at the time a request is made and generates HTML.[1]\nIn b', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Common_Gateway_Interface', 0),
(184, 'Web template system', 'A web template system in web publishing lets web designers and developers work with web templates to automatically generate custom web pages, such as the results from a search. This reuses static web page elements while defining dynamic elements based on web request parameters.\nWeb templates support static content, providing basic structure and appearance. Developers can implement templates from  content management systems, web application frameworks, and HTML editors.\nA web template system is c', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Web_template_system', 0),
(185, 'Computing platform', 'A computing platform or digital platform[1] is the environment in which a piece of software is executed. It may be the hardware or the operating system (OS), even a web browser and associated application programming interfaces, or other underlying software, as long as the program code is executed with it. Computing platforms have different abstraction levels, including a computer architecture, an OS, or runtime libraries.[2] A computing platform is the stage on which computer programs can run.\nA', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Computing_platform', 0),
(186, 'Zeev Suraski', 'Zeev Suraski (Hebrew: זאב סורסקי‎ pronounced [zeˈʔev suˈʁaski]) is an Israeli programmer, PHP developer[1][2] and co-founder of Zend Technologies. A graduate of the Technion in Haifa, Israel, Suraski and Andi Gutmans created PHP 3 in 1997.[3] In 1999 they wrote the Zend Engine, the core of PHP 4, and founded Zend Technologies, which has since overseen PHP advances.[4] The name Zend is a portmanteau of their forenames, Zeev and Andi.\nSuraski is an emeritus member of the Apache Software Foundation', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Zeev_Suraski', 0),
(187, 'File:Custom-software-developement-php-net.JPG', ' \nhttps://creativecommons.org/licenses/by-sa/4.0\nCC BY-SA 4.0 \nCreative Commons Attribution-Share Alike 4.0 \ntruetrue\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:Custom-software-developement-php-net.JPG', 0),
(188, 'Andi Gutmans', 'Andi (Andrei[1]) Gutmans is a  programmer and entrepreneur, born in Switzerland and currently residing in the United States. He helped to co-create PHP, and co-founded Zend Technologies[2] and is a General Manager  at Amazon Web Services. A graduate of the Technion, the Israel Institute of Technology in Haifa, Gutmans and fellow student Zeev Suraski created PHP 3 in 1997. In 1999 they wrote the Zend Engine, the core of PHP 4, and founded Zend Technologies, which has since overseen PHP advances, ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Andi_Gutmans', 0),
(189, 'Form (HTML)', 'A webform, web form or HTML form on a web page allows a user to enter data that is sent to a server for processing. Forms can resemble paper or database forms because web users fill out the forms using checkboxes, radio buttons, or text fields.  For example, forms can be used to enter shipping or credit card data to order a product, or can be used to retrieve search results from a search engine.\nForms are enclosed in the HTML <form> element. This element specifies the communication endpoint the ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Web_form', 0),
(190, 'File:Andi Gutmans 1.jpg', 'https://creativecommons.org/licenses/by/2.0\nCC BY 2.0 \nCreative Commons Attribution 2.0 \ntruetrue\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:Andi_Gutmans_1.jpg', 0),
(191, 'Interpreter (computing)', 'In computer science, an interpreter is a computer program that directly executes instructions written in a programming or scripting language, without requiring them previously to have been compiled into a machine language program. An interpreter generally uses one of the following strategies for program execution:\nEarly versions of Lisp programming language and Dartmouth BASIC would be examples of the first type. Perl, Python, MATLAB, and Ruby are examples of the second, while UCSD Pascal is an ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Interpreter_(computing)', 0),
(192, 'Rewrite (programming)', 'A rewrite in computer programming is the act or result of re-implementing a large portion of existing functionality without re-use of its source code or writing inscription. When the rewrite is not using existing code at all, it is common to speak of a rewrite from scratch.\nA piece of software is typically rewritten when one or more of the following apply:\nSeveral software engineers, such as Joel Spolsky[1] have warned against total rewrites, especially under schedule constraints or competitive ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Rewrite_(programming)', 0),
(193, 'Programming language theory', 'Programming language theory (PLT) is a branch of computer science that deals with the design, implementation, analysis, characterization, and classification of programming languages and their individual features.  It falls within the discipline of computer science, both depending on and affecting mathematics, software engineering, linguistics and even cognitive science.  It is a well-recognized branch of computer science, and an active research area, with results published in numerous journals d', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Programming_language_theory', 0),
(194, 'Dynamic web page', 'A server-side dynamic web page is a web page whose construction is controlled by an application server processing server-side scripts. In server-side scripting, parameters determine how the assembly of every new web page proceeds, including the setting up of more client-side processing.\nA client-side dynamic web page processes the web page using HTML scripting running in the browser as it loads.  JavaScript and other scripting languages determine the way the HTML in the received page is parsed i', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Dynamic_web_application', 0),
(195, 'Recursive acronym', 'A recursive acronym is an acronym that refers to itself. The term was first used in print in 1979 in Douglas Hofstadter\'s book Gödel, Escher, Bach: An Eternal Golden Braid, in which Hofstadter invents the acronym GOD, meaning \"GOD Over Djinn\", to help explain infinite series, and describes it as a recursive acronym.[1] Other references followed,[2] however the concept was used as early as 1968 in John Brunner\'s science fiction novel Stand on Zanzibar. In the story, the acronym EPT (Education for', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Recursive_acronym', 0),
(196, 'Name binding', 'In programming languages, name binding is the association of entities (data and/or code) with identifiers.[1] An identifier bound to an object is said to reference that object. Machine languages have no built-in notion of identifiers, but name-object bindings as a service and notation for the programmer is implemented by programming languages. Binding is intimately connected with scoping, as scope determines which names bind to which objects – at which locations in the program code (lexically) a', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Late_static_binding', 0),
(197, 'Personal web page', 'Personal web pages are world wide web pages created by an individual to contain content of a personal nature rather than content pertaining to a company, organization or institution.  Personal web pages are primarily used for informative or entertainment purposes but can also be used for personal career marketing (by containing a list of the individual\'s skills, experience and a CV), social networking with other people with shared interests, or as a space for personal expression.\nThese terms do ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Personal_homepage', 0),
(198, 'De facto', 'In law and government, de facto (/deɪ ˈfæktoʊ, di -/ day FAK-toh, dee -⁠;[1] Latin: de facto [deː ˈfaktoː], \"in fact\") describes practices that exist in reality, even though they are not officially recognized by laws.[2][3][4] It is commonly used to refer to what happens in practice, in contrast with de jure (\"by law\"), which refers to things that happen according to law.\nA  de facto standard is a standard (formal or informal) that has achieved a dominant position by tradition, enforcement, or m', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/De_facto', 0),
(199, 'Type system', 'In programming languages, a type system is a logical system comprising a set of rules that assigns a property called a type to the various constructs of a computer program, such as variables, expressions, functions or modules.[1] These types formalize and enforce the otherwise implicit categories the programmer uses for algebraic data types, data structures, or other components (e.g. \"string\", \"array of float\", \"function returning boolean\"). The main purpose of a type system is to reduce possibi', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Dynamic_typing', 0),
(200, 'Type system', 'In programming languages, a type system is a logical system comprising a set of rules that assigns a property called a type to the various constructs of a computer program, such as variables, expressions, functions or modules.[1] These types formalize and enforce the otherwise implicit categories the programmer uses for algebraic data types, data structures, or other components (e.g. \"string\", \"array of float\", \"function returning boolean\"). The main purpose of a type system is to reduce possibi', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Type_system', 0),
(201, 'Web framework', 'A web framework (WF) or web application framework (WAF) is a software framework that is designed to support the development of web applications including web services, web resources, and web APIs. Web frameworks provide a standard way to build and deploy web applications on the World Wide Web. Web frameworks aim to automate the overhead associated with common activities performed in web development. For example, many web frameworks provide libraries for database access, templating frameworks, an', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Web_framework', 0);
INSERT INTO `article` (`article_id`, `title`, `description`, `website`, `image_url`, `link_url`, `view_count`) VALUES
(202, 'Syntax', 'In linguistics, syntax (/ˈsɪntæks/[1][2]) is the set of rules, principles, and processes that govern the structure of sentences (sentence structure) in a given language, usually including word order. The term syntax is also used to refer to the study of such principles and processes.[3] The goal of many syntacticians is to discover the syntactic rules common to all languages.\nThe word syntax comes from Ancient Greek: σύνταξις \"coordination\", which consists of σύν syn, \"together\", and τάξις táxis', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Syntax', 0),
(203, 'Software release life cycle', '\nA software release life cycle is the sum of the stages of development and maturity for a piece of computer software. Cycles range from its initial development to its eventual release, and include updated versions of the released version to help improve software or fix software bugs still present in the software.\nComputer users are most likely to be familiar with the release cycle beta as software products are sometimes publicly advertised as being beta in order to reduce users\' expectations of ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Beta_development_stage', 0),
(204, 'Software', '\nComputer software, or simply software, is a collection of data or computer instructions that tell the computer how to work. This is in contrast to physical hardware, from which the system is built and actually performs the work. In computer science and software engineering, computer software is all information processed by computer systems, programs and data. Computer software includes computer programs, libraries and related non-executable data, such as online documentation or digital media. C', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Computer_software', 0),
(205, 'Object-oriented programming', '\nObject-oriented programming (OOP) is a programming paradigm based on the concept of \"objects\", which can contain data, in the form of fields (often known as attributes or properties), and code, in the form of procedures (often known as methods). A feature of objects is an object\'s procedures that can access and often modify the data fields of the object with which they are associated (objects have a notion of \"this\" or \"self\"). In OOP, computer programs are designed by making them out of object', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Object-oriented_programming', 0),
(206, 'Parsing', 'Parsing, syntax analysis, or syntactic analysis is the process of analyzing a string of symbols, either in natural language, computer languages or data structures, conforming to the rules of a formal grammar.  The term parsing comes from Latin pars (orationis), meaning part (of speech).[1]\nThe term has slightly different meanings in different branches of linguistics and computer science.  Traditional sentence parsing is often performed as a method of understanding the exact meaning of a sentence', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Parser', 0),
(207, '32-bit computing', 'In computer architecture, 32-bit integers, memory addresses, or other data units are those that are  32 bits (4 octets) wide.  Also, 32-bit CPU and ALU architectures are those that are based on registers, address buses, or data buses of that size. 32-bit microcomputers are computers in which 32-bit microprocessors are the norm.\nA 32-bit register can store 232 different values. The range of integer values that can be stored in 32 bits depends on the integer representation used. With the two most ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/32-bit', 0),
(208, 'IA-32', '\nIA-32 (short for \"Intel Architecture, 32-bit\", sometimes also called i386[1][2])[3] is the 32-bit version of the x86 instruction set architecture, designed by Intel and first implemented in the 80386 microprocessor in 1985.  IA-32 is the first incarnation of x86 that supports 32-bit computing;[4] as a result, the \"IA-32\" term may be used as a metonym to refer to all x86 versions that support 32-bit computing.[5][6]\nWithin various programming language directives, IA-32 is still sometimes referre', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/IA-32', 0),
(209, 'Graphical user interface', 'The graphical user interface (GUI /ˈɡuːaɪ/ gee-you-eye[1][Note 1]) is a form of user interface that allows users to interact with electronic devices through graphical icons and audio indicator such as primary notation, instead of text-based user interfaces, typed command labels or text navigation. GUIs were introduced in reaction to the perceived steep learning curve of command-line interfaces (CLIs),[2][3][4] which require commands to be typed on a computer keyboard.\nThe actions in a GUI are us', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Graphical_user_interface', 0),
(210, 'Software bug', '\nA software bug is an error, flaw or fault in a computer program or system that causes it to produce an incorrect or unexpected result, or to behave in unintended ways. The process of finding and fixing bugs is termed \"debugging\" and often uses formal techniques or tools to pinpoint bugs, and since the 1950s, some computer systems have been designed to also deter, detect or auto-correct various computer bugs during operations.\nMost bugs arise from mistakes and errors made in either a program\'s s', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Software_bug', 0),
(211, 'Functional programming', 'In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the evaluation of mathematical functions and avoids changing-state and mutable data. It is a declarative programming paradigm in that programming is done with expressions or declarations[1] instead of statements. In functional code, the output value of a function depends only on its arguments, so calling a function with the same valu', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Functional_programming', 0),
(212, 'Hash function', 'A hash function is any function that can be used to map data of arbitrary size to fixed-size values. The values returned by a hash function are called hash values, hash codes, digests, or simply hashes.  The values are used to index a fixed-size table called a hash table. Use of a hash function to index a hash table is called hashing or scatter storage addressing.\nHash functions and their associated hash tables are used in data storage and retrieval applications to access data in a small and nea', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Hash_function', 0),
(213, 'Command-line interface', '\nA command-line interface (CLI) processes commands to a computer program in the form of lines of text. The program which handles the interface is called a command-line interpreter or command-line processor. Operating systems implement a command-line interface in a shell for interactive access to operating system functions or services. Such access was primarily provided to users by computer terminals starting in the mid-1960s, and continued to be used throughout the 1970s and 1980s on VAX/VMS, Un', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Command-line_interface', 0),
(214, 'Operating system', '\n\nAn operating system (OS) is system software that manages computer hardware, software resources, and provides common services for computer programs.\nTime-sharing operating systems schedule tasks for efficient use of the system and may also include accounting software for cost allocation of processor time, mass storage, printing, and other resources.\nFor hardware functions such as input and output and memory allocation, the operating system acts as an intermediary between programs and the comput', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Operating_system', 0),
(215, 'Branching (version control)', 'Branching, in version control and software configuration management, is the duplication of an object under version control (such as a source code file or a directory tree) so that modifications can occur in parallel along multiple branches.\nBranches are also known as trees, streams or codelines. The originating branch is sometimes called the parent branch, the upstream branch (or simply upstream, especially if the branches are maintained by different organizations or individuals), or the backing', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Branching_(version_control)', 0),
(216, '64-bit computing', 'In computer architecture, 64-bit integers, memory addresses, or other data units are those that are 64 bits (8 octets) wide. Also, 64-bit CPU and ALU architectures are those that are based on registers, address buses, or data buses of that size. 64-bit microcomputers are computers in which 64-bit microprocessors are the norm. From the software perspective, 64-bit computing means the use of code with 64-bit virtual memory addresses. However, not all 64-bit instruction sets support full 64-bit vir', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/64-bit', 0),
(217, 'Server Application Programming Interface', 'In computing, Server Application Programming Interface (SAPI) is the direct module interface to web servers such as the Apache HTTP Server, Microsoft IIS, and Oracle iPlanet Web Server.  Microsoft uses the term Internet Server Application Programming Interface (ISAPI), and the defunct Netscape web server used the term Netscape Server Application Programming Interface (NSAPI) for the same purpose.[1]  In other words, SAPI is an application programming interface (API) provided by the web server to', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Server_application_programming_interface', 0),
(218, 'Database', 'A database is an organized collection of data, generally stored and accessed electronically from a computer system. Where databases are more complex they are often developed using formal design and modeling techniques.\nThe database management system (DBMS) is the software that interacts with end users, applications, and the database itself to capture and analyze the data. The DBMS software additionally encompasses the core facilities provided to administer the database. The sum total of the data', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Database', 0),
(219, 'Just-in-time compilation', 'In computing, just-in-time (JIT) compilation (also dynamic translation or run-time compilations)[1] is a way of executing computer code that involves compilation during execution of a program – at run time – rather than before execution.[2] Most often, this consists of source code or more commonly bytecode translation to machine code, which is then executed directly. A system implementing a JIT compiler typically continuously analyses the code being executed and identifies parts of the code wher', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Just-in-time_compilation', 0),
(220, 'Usenet', '\nUsenet (/ˈjuːznɛt/) is a worldwide distributed discussion system available on computers. It was developed from the general-purpose Unix-to-Unix Copy (UUCP) dial-up network architecture. Tom Truscott and Jim Ellis conceived the idea in 1979, and it was established in 1980.[1] Users read and post messages (called articles or posts, and collectively termed news) to one or more categories, known as newsgroups. Usenet resembles a bulletin board system (BBS) in many respects and is the precursor to I', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Usenet', 0),
(221, 'Switch statement', 'In computer programming languages, a switch statement is a type of selection control mechanism used to allow the value of a variable or expression to change the control flow of program execution via search and map.\nSwitch statements function somewhat similarly to the if statement used in programming languages like C/C++, C#, Visual Basic .NET, Java and exists in most high-level imperative programming languages such as Pascal, Ada, C/C++, C#, Visual Basic .NET, Java, and in many other types of la', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Switch_statement', 0),
(222, 'Software versioning', 'Software upgrade versioning is the process of assigning either unique version names or unique version numbers to unique states of computer software. Within a given version number category (major, minor), these numbers are generally assigned in increasing order and correspond to new developments in the software. At a fine-grained level, revision control is often used for keeping track of incrementally different versions of information, whether or not this information is computer software.\nModern ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Software_versioning', 0),
(223, 'x86-64', '\n\nx86-64 (also known as x64, x86_64, AMD64 and Intel 64[note 1]) is the 64-bit version of the x86 instruction set. It introduces two new modes of operation, 64-bit mode and compatibility mode, along with a new 4-level paging mode. With 64-bit mode and the new paging mode, it supports vastly larger amounts of virtual memory and physical memory than is possible on its 32-bit predecessors, allowing programs to store larger amounts of data in memory. x86-64 also expands general-purpose registers to ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/X86-64', 0),
(224, 'Global variable', 'In computer programming, a global variable is a variable with global scope, meaning that it is visible (hence accessible) throughout the program, unless shadowed. The set of all global variables is known as the global environment or global state. In compiled languages, global variables are generally static variables, whose extent (lifetime) is the entire runtime of the program, though in interpreted languages (including command-line interpreters), global variables are generally dynamically alloc', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Global_variable', 0),
(225, 'Foreach loop', 'Foreach loop (or for each loop) is a control flow statement for traversing items in a collection. Foreach is usually used in place of a standard for loop statement. Unlike other for loop constructs, however, foreach loops[1] usually maintain no explicit counter: they essentially say \"do this to everything in this set\", rather than \"do this x times\". This avoids potential off-by-one errors and makes code simpler to read. In object-oriented languages an iterator, even if implicit, is often used as', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Foreach_loop', 0),
(226, 'Variable (computer science)', 'In computer programming, a variable or scalar is a storage address (identified by a memory address) paired with an associated symbolic name, which contains some known or unknown quantity of information referred to as a value. The variable name is the usual way to reference the stored value, in addition to referring to the variable itself, depending on the context. This separation of name and content allows the name to be used independently of the exact information it represents. The identifier i', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Variable_(computer_science)', 0),
(227, 'Bitwise operation', '\nIn digital computer programming, a bitwise operation operates on one or more bit patterns or binary numerals at the level of their individual bits. It is a fast and simple action, directly supported by the processor, and is used to manipulate values for comparisons and calculations.\nOn simple low-cost processors, typically, bitwise operations are substantially faster than division, several times faster than multiplication, and sometimes significantly faster than addition.[clarification needed] ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Left-shift_operator', 0),
(228, 'Bitwise operation', '\nIn digital computer programming, a bitwise operation operates on one or more bit patterns or binary numerals at the level of their individual bits. It is a fast and simple action, directly supported by the processor, and is used to manipulate values for comparisons and calculations.\nOn simple low-cost processors, typically, bitwise operations are substantially faster than division, several times faster than multiplication, and sometimes significantly faster than addition.[clarification needed] ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Right-shift_operator', 0),
(229, 'Name binding', 'In programming languages, name binding is the association of entities (data and/or code) with identifiers.[1] An identifier bound to an object is said to reference that object. Machine languages have no built-in notion of identifiers, but name-object bindings as a service and notation for the programmer is implemented by programming languages. Binding is intimately connected with scoping, as scope determines which names bind to which objects – at which locations in the program code (lexically) a', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Name_binding', 0),
(230, 'Unmanned aerial vehicle', '\nAn unmanned aerial vehicle (UAV) (or uncrewed aerial vehicle,[2] commonly known as a drone) is an aircraft without a human pilot on board and a type of unmanned vehicle. UAVs are a component of an unmanned aircraft system (UAS); which include a UAV, a ground-based controller, and a system of communications between the two. The flight of UAVs may operate with various degrees of autonomy: either under remote control by a human operator or autonomously by onboard computers.[3]\nCompared to crewed a', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Unmanned_aerial_vehicle', 0),
(231, 'Exception handling', 'Exception handling  is the process of responding to the occurrence, during computation, of exceptions – anomalous or exceptional conditions requiring special processing – often disrupting the normal flow of program execution. It is provided by specialized programming language constructs, computer hardware mechanisms like interrupts or operating system IPC facilities like signals.\nIn general, an exception breaks the normal flow of execution and executes a pre-registered exception handler. The det', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Exception_(computer_science)', 0),
(232, 'Namespace', 'In computing, a namespace is a set of symbols that are used to organize objects of various kinds, so that these objects may be referred to by name. A namespace ensures that all the identifiers within it have unique names so that they can be easily identified. Prominent examples include:\nNamespaces are commonly structured as hierarchies to allow reuse of names in different contexts. As an analogy, consider a system of naming of people where each person has a proper name, as well as a family name ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Namespace', 0),
(233, 'Goto', 'GoTo (goto, GOTO, GO TO or other case combinations, depending on the programming language) is a statement found in many computer programming languages.  It performs a one-way transfer of control to another line of code; in contrast a function call normally returns control.  The jumped-to locations are usually identified using labels, though some languages use line numbers.  At the machine code level, a goto is a form of branch or jump statement, in some cases combined with a stack adjustment. Ma', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Goto', 0),
(234, 'Garbage collection (computer science)', '\nIn computer science, garbage collection (GC) is a form of automatic memory management. The garbage collector, or just collector, attempts to reclaim garbage, or memory occupied by objects that are no longer in use by the program. Garbage collection was invented by John McCarthy around 1959 to simplify manual memory management in Lisp.[1]\nGarbage collection is essentially the opposite of manual memory management, which requires the programmer to specify which objects to deallocate and return to ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)', 0),
(235, 'MIME', 'Multipurpose Internet Mail Extensions (MIME) is an Internet standard that extends the format of email messages to support text in character sets other than ASCII, as well as attachments of audio, video, images, and application programs.  Message bodies may consist of multiple parts, and header information may be specified in non-ASCII character sets. Email messages with MIME formatting are typically transmitted with standard protocols, such as the  Simple Mail Transfer Protocol (SMTP), the Post ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/MIME', 0),
(236, 'Closure (computer programming)', 'In programming languages, a closure, also lexical closure or function closure, is a technique for implementing lexically scoped name binding in a language with first-class functions. Operationally, a closure is a record storing a function[a] together with an environment.[1] The environment is a mapping associating each free variable of the function (variables that are used locally, but defined in an enclosing scope) with the value or reference to which the name was bound when the closure was cre', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Closure_(computer_science)', 0),
(237, 'Trait (computer programming)', 'In computer programming, a trait is a concept used in object-oriented programming, which represents a set of methods that can be used to extend the functionality of a class.[1][2]\nTraits both provide a set of methods that implement behaviour to a class, and require that the class implement a set of methods that parameterize the provided behaviour.\nFor inter-object communication, traits are somewhat between an object-oriented protocol (interface) and a mixin. An interface may define one or more b', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Trait_(computer_programming)', 0),
(238, 'Variadic function', 'In mathematics and in computer programming, a variadic function is a function of indefinite arity, i.e., one which accepts a variable number of arguments. Support for variadic functions differs widely among programming languages.\nThe term variadic is a neologism, dating back to 1936.[1]  The term was not widely used until the 1970s.\nThere are many mathematical and logical operations that come across naturally as variadic functions. For instance, the summing of numbers or the concatenation of str', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Variadic_function', 0),
(239, 'Abstract syntax tree', 'In computer science, an abstract syntax tree (AST), or just syntax tree, is a tree representation of the abstract syntactic structure of source code written in a programming language. Each node of the tree denotes a construct occurring in the source code.\nThe syntax is \"abstract\" in the sense that it does not represent every detail appearing in the real syntax, but rather just the structural or content-related details. For instance, grouping parentheses are implicit in the tree structure, so the', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Abstract_Syntax_Tree', 0),
(240, 'Three-way comparison', 'In computer science, a three-way comparison takes two values A and B belonging to a type with a total order and determines whether A < B, A = B, or A > B in a single operation, in accordance with the mathematical law of trichotomy.\nMany processors have instruction sets that support such an operation on primitive types.\nSome machines have signed integers based on a sign-and-magnitude or one\'s complement representation (see signed number representations), both of which allow a differentiated posit', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Three-way_comparison', 0),
(241, 'Generator (computer programming)', 'In computer science, a generator is a routine that can be used to control the iteration behaviour of a loop. All generators are also iterators.[1] A generator is very similar to a function that returns an array, in that a generator has parameters, can be called, and generates a sequence of values. However, instead of building an array containing all the values and returning them all at once, a generator yields the values one at a time, which requires less memory and allows the caller to get star', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Generator_(computer_programming)', 0),
(242, 'Null coalescing operator', 'The null coalescing operator (called the Logical Defined-Or operator in Perl) is a binary operator that is part of the syntax for a basic conditional expression in several programming languages, including C#,[1] , PowerShell as of version 7.0.0,[2] Perl as of version 5.10,[3] Swift,[4] and PHP 7.0.0.[5] While its behavior differs between implementations, the null coalescing operator generally returns the result of its left-most operand if it exists and is not null, and otherwise returns the righ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Null_coalescing_operator', 0),
(243, 'Void type', 'The void type, in several programming languages derived from C and Algol68, is the type for the result of a function that returns normally, but does not provide a result value to its caller.  Usually such functions are called for their side effects, such as performing some task or writing to their output parameters. The usage of the void type in such context is comparable to procedures in Pascal and syntactic constructs which define subroutines in Visual Basic. It is also similar to the unit typ', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Void_type', 0),
(244, 'File:Webysther 20160423 - Elephpant.svg', 'Old version\n', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/File:Webysther_20160423_-_Elephpant.svg', 0),
(245, 'Information hiding', 'In computer science, information hiding is the principle of segregation of the design decisions in a computer program that are most likely to change, thus protecting other parts of the program from extensive modification if the design decision is changed. The protection involves providing a stable interface which protects the remainder of the program from the implementation (the details that are most likely to change).\nWritten another way, information hiding is the ability to prevent certain asp', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Information_hiding', 0),
(246, 'Cryptographically secure pseudorandom number generator', 'A cryptographically secure pseudorandom number generator (CSPRNG) or cryptographic pseudorandom number generator (CPRNG)[1] is a pseudorandom number generator (PRNG) with properties that make it suitable for use in cryptography. It is also loosely known as a cryptographic random number generator (CRNG) (see Random number generation#\"True\" vs. pseudo-random numbers).[2][3] \nMost cryptographic applications require random numbers, for example:\nThe \"quality\" of the randomness required for these appl', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/CSPRNG', 0),
(247, 'Stuffed toy', 'A stuffed toy is a toy with an outer fabric sewn from a textile and stuffed with flexible material. They are known by many names, such as plush toys, stuffed animals, plushies, or stuffies. In Britain and Australia, they may be called soft toys or cuddly toys. Textiles commonly used for the outer fabric include plain cloth, as well as pile textiles like plush or terrycloth, or even socks. Common stuffing materials include synthetic fiber, batting, cotton, straw, wood wool, plastic pellets, and b', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Plush_toy', 0),
(248, 'Class (computer programming)', 'In object-oriented programming, a class is an extensible program-code-template for creating objects, providing initial values for state (member variables) and implementations of behavior (member functions or methods).[1][2] In many languages, the class name is used as the name for the class (the template itself), the name for the default constructor of the class (a subroutine that creates objects), and as the type of objects generated by instantiating the class; these distinct concepts are easil', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Anonymous_class', 0),
(249, 'Elephant', '\n\n\n\nElephants are mammals of the family Elephantidae and the largest existing land animals. Three species are currently recognised: the African bush elephant, the African forest elephant, and the Asian elephant. Elephantidae is the only surviving family of the order Proboscidea; extinct members include the mastodons. The family Elephantidae also contains several now-extinct groups, including the mammoths and straight-tusked elephants. African elephants have larger ears and concave backs, whereas', 'Wikipedia', 'upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/220px-African_Bush_Elephant.jpg', 'https://en.wikipedia.org/wiki/Elephant', 0),
(250, 'Wikipedia:Citation needed', '\nTo ensure that all Wikipedia content is verifiable, anyone may question an uncited claim. If your work has been tagged, please provide a reliable source for the statement, and discuss if needed.\nYou can add a citation by selecting from the drop-down  menu at the top of the editing box. In markup, you can add a citation manually using ref tags. There are also more elaborate ways to cite sources.\nIn wiki markup, you can question an uncited claim by inserting a simple {{Citation needed}} tag, or a', 'Wikipedia', 'public/images/imagenotfound.png', 'https://en.wikipedia.org/wiki/Wikipedia:Citation_needed', 0),
(251, 'David Walsh Blog - Home', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/', 0),
(252, 'Awesome Forward & Reverse Geocoding API: positionstack', 'One awesome web functionality we take for granted is geolocation. Based on geolocation data, we can get someone to their destination, provide them suggestions based on their location, and so on. One downside of native geolocation, especially in the browser, is that it\'s limited in both input and output.That\'s where an awesome service like positionstack comes in -- positionstack allows developers to complete forward and reverse geocoding to get maximum data to maximize conversion and functionalit', 'DavidWalsh', 'https://davidwalsh.name/demo/2020/01/positionstack.png', 'https://davidwalsh.name/awesome-forward-reverse-geocoding-api-positionstack', 0),
(253, 'Demos Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/demos', 0),
(254, 'Tips for Working Remotely and Enjoying It!', 'With the coronavirus spreading and employers telling employees work from home if possible, there are scores of people getting their first taste of working remotely.  Depending on your experience and discipline levels, this could be a welcomed change or a complete culture shock.  The amount of freedom your find yourself in can be similar the leaving high school -- no one telling you what to do, where to go, etc -- but don\'t let that freedom cost you your job.I\'ve worked remotely for a decade so I', 'DavidWalsh', 'https://davidwalsh.name/demo/2020/03/new-office-14-1024x247-1024x247.jpg', 'https://davidwalsh.name/tips-on-working-remotely', 0),
(255, 'How to Set a Default Commit Message', 'Having a default commit message is really useful for a number of reasons:To set a default commit message on your local machine, start by executing the following from command line:This tells your local git config to pull the text from ~/.gitmessage as the default commit message.  You could set the text to something like:Of course, if you set your commit message via git commit -m {description}, the default will not be used, so it\'s a win-win!', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/default-commit-message', 0),
(256, 'HTML5 Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/html5', 0),
(257, 'Firefox OS Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/firefoxos', 0),
(258, 'Welcome to My New Office', 'My first professional web development was at a small print shop where I sat in a windowless cubical all day. I suffered that boxed in environment for almost five years before I was able to find a remote job where I worked from home. The first thing I told myself when leaving that first job was that I\'d never let myself work in a box again, and if possible, I\'d never work outside the home.Three years ago I wrote Welcome to My Office, which gave you all a glimpse of work environment.  I loved that', 'DavidWalsh', 'https://davidwalsh.name/demo/2019/02/new-office-14-1024x247.jpg', 'https://davidwalsh.name/new-office', 0),
(259, 'Hex Opacity Table', 'We\'ve used hex colors for years but 8-digit hexadecimal is still relatively new.  While rgba is simple to understand, 8-digit hex is more difficult, as you need to provide a hex representation of a numeric value.The following is a hexadecimal chart of opacity!Depending upon its use in web or mobile platforms, sometimes the hex value needs to be at the beginning (Kotlin), other times the end (web).', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/hex-opacity', 0),
(260, 'Conquering Impostor Syndrome', 'Two years ago I documented my struggles with Imposter Syndrome and the response was immense.  I received messages of support and commiseration from new web developers, veteran engineers, and even persons of all experience levels in other professions.  I\'ve even caught myself reading the post many times with the hopes that I would just snap out of it.  The truth is that most of us will never be free of self-doubt......but if I\'m completely honest, I don\'t ever want to be free of Imposter Syndrome', 'DavidWalsh', 'https://davidwalsh.name/demo/underdog.jpeg', 'https://davidwalsh.name/conquering-impostor-syndrome', 0),
(261, 'Features Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/features', 0),
(262, 'CSS Ellipsis Beginning of String', 'I was incredibly happy when CSS text-overflow: ellipsis (married with fixed width and overflow: hidden was introduced to the CSS spec and browsers; the feature allowed us to stop trying to marry JavaScript width calculation with string width calculation and truncation.  CSS ellipsis was also very friendly to accessibility.The CSS text-overflow: ellipsis feature is great but is essentially meant to ellipsize strings only at the end; what if we want to ellipsize the beginning of a screen?  The use', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/css-ellipsis-left', 0),
(263, 'prefers-color-scheme: CSS Media Query', 'One device and app feature I\'ve come to appreciate is the ability to change between light and dark modes. If you\'ve ever done late night coding or reading, you know how amazing a dark theme can be for preventing eye strain and the headaches that result. macOS recently implemented a native dark mode but that mode doesn\'t convert websites to a dark interface, so you\'re still getting a bright site regardless of native theme. Wouldn\'t it be amazing if websites would also go dark or light based on us', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/prefers-color-scheme', 0),
(264, 'How to Specify User Agent with cURL', 'Over the years I\'ve shared how to perform a number of actions with cURL: how to send POST data, how to retrieve headers, follow redirects, check GZIP encoding, and more.  Another useful cURL directive is sending the user agent, as some servers respond with different content or headers depending on the user agent.  Let\'s have a look at how easy it is to send the user agent with cURL!The user agent may be sent with the -A or --user-agent directives:Luckily we don\'t rely on user agent strings as mu', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/how-to-specify-user-agent-with-curl', 0),
(265, 'SEO Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/seo', 0),
(266, 'View Mac Calendar from Command Line', 'As someone that loves using UI tools, I do pride myself in learning how to accomplish the same feats from command line. Don\'t believe me? Check out my Command Line tutorials section -- I guarantee you\'ll learn quite a bit. Recently I learned that you can view basic calendars from command line with the cal command:Seeing the calendar is cool but I\'d like to see my calendar events for each date.  After looking through a number of options, I\'ve found icalBuddy to be the best for displaying Mac Cale', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/calendar-command-line', 0),
(267, 'David Walsh', 'My name is David Walsh.  I\'m a 33-year old web developer and software engineer from Madison, Wisconsin.  In the web world I\'m:In a past web life I was:I don\'t design the sites, I make them work.My expertise and interest lies in front-end technologies, including HTML/5, CSS, JavaScript (as well as frameworks like jQuery, MooTools, and Dojo Toolkit).  My server side skills revolve around PHP and Python.  I enjoy dabbling in mobile development and edge devices and environments.  I focus on open sou', 'DavidWalsh', '/demo/about-david-walsh.jpg', 'https://davidwalsh.name/about-david-walsh', 0),
(268, 'How to Create a RetroPie on Raspberry Pi – Graphical Guide', 'Today we get to play amazing games on our super powered game consoles, PCs, VR headsets, and even mobile devices.  While I enjoy playing new games these days, I do long for the retro gaming systems I had when I was a kid: the original Nintendo (NES), Nintendo 64, Sega, and so on.  Games like Mario 64, GoldenEye, Mario Kart 64, and Ocarina of Time were incredible.  They didn\'t have the graphics but the gameplay was outstanding.To enjoy these games today I must dust off my original Nintendo 64 (20', 'DavidWalsh', 'https://davidwalsh.name/demo/retropie-graphical-guide/retropie-logo.png', 'https://davidwalsh.name/retropie-graphical-guide', 0),
(269, 'WordPress Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/wordpress', 0),
(270, 'Vertically Centering with Flexbox', 'Vertically centering sibling child contents is a task we\'ve long needed on the web but has always seemed way more difficult than it should be.  We initially used tables to accomplish the task, then moved on to CSS and JavaScript tricks because table layout was horribly inefficient -- yet it seemed that tables were the easiest and most reliable way to make vertical centering happen.  When the vertical-align CSS property was introduced, I was incredibly excited, but quickly found that it didn\'t us', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/vertical-center-flexbox', 0),
(271, 'Contact', 'If you have an opinion or update to any post on my website, please share your thought within the comments. I believe in sharing thoughts, ideas, and criticisms in the context of the post so that everyone learns and everyone can contribute.  Please keep your comments civil and professional.As much as I try to help everyone that asks, please don\'t count on me for technical support.  Please use the comment section of posts to ask for help, or visit one of many awesome web resources to find the help', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/contact', 0),
(272, 'Deals', 'The following are recommended vendors.  I\'ve used all of these services in the past and they\'re reliable, cost-effective, and hassle-free.$4 Domains and 20% Off Hosting!Save $50 on Yearly Hosting (DAVIDWALSH) or $10/Month (DAVIDWALSH10)!', 'DavidWalsh', '/wp-content/themes/london/images/sda/mt-billboard-3.png', 'https://davidwalsh.name/deals', 0),
(273, 'MooTools Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/mootools', 0),
(274, 'Mozilla', 'I have the pleasure of working for the web freedom fighters known as Mozilla.  Mozilla is without a doubt the best organization in the world to work for.  I spend the majority of my time improving the best web development documentation website in the world:  the Mozilla Developer Network.  Since I joined Mozilla and the MDN team, we have:The Mozilla Developer Network is a community-driven documentation site, so please take the time to contribute to the cause!I\'ve also been able to chip in a bit ', 'DavidWalsh', '/demo/mozilladevs.jpg', 'https://davidwalsh.name/mozilla', 0),
(275, 'Creating Spacers with Flexbox', 'I was one of the biggest fans of flexbox before it hit but, due to being shuffled around at Mozilla, I never had the chance to use it in any practice project; thus, flexbox still seems like a bit of a mystery to me.  This greatly pains me because I feel left out of the flexbox revolution, though these days the sentiment I hear is that flexbox turned out to be a bust and that CSS grid is the new hotness.One awesome utility of flexbox is spacers.  One problem of the past was docking items to the l', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/flexbox-spacer', 0),
(276, 'PHP Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/php', 0),
(277, 'Dojo Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/dojo', 0),
(278, 'JavaScript Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/javascript', 0),
(279, 'Override window.alert', 'For years the only bit of feedback web developers could get was via alert(\"{str}\") calls. These days we have the web console but, in rare cases, we don\'t have a console and alert calls are our only window into a value at a given time.One problem: if an alert sneaks into production code, your site looks like it\'s been hacked. Your site looks like it\'s malware!  To prevent any of those issues, you can add this snippet to your production build:This tiny line of JavaScript could save your site from ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/override-window-alert', 0),
(280, 'React Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/react', 0),
(281, 'Node.js Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/nodejs', 0),
(282, 'Interview with a Pornhub Web Developer', '\n\nRegardless of your stance on pornography, it would be impossible to deny the massive impact the adult website industry has had on pushing the web forward. From pushing the browser\'s video limits to pushing ads through WebSocket so ad blockers don\'t detect them, you have to be clever to innovate at the bleeding edge of the web.I was recently lucky enough to interview a Web Developer at the web\'s largest adult website: Pornhub. I wanted to learn about the tech, how web APIs can improve, and what', 'DavidWalsh', 'https://davidwalsh.name/demo/PornHubLogo.png', 'https://davidwalsh.name/pornhub-interview', 0),
(283, 'Chris Coyier’s Favorite CodePen Demos IV', 'Did you know you can triple-heart things on CodePen? We’ve had that little not-so-hidden feature forever. You can click that little heart button on any Pen (or Project, Collection, or Post) on CodePen to show the creator a little love, but you can click it again and again to heart it just that little bit more. That’s useful for a couple of reasons. It gets calculated into the algorithms-that-be for popularity, and also, you can see items you’ve loved at the different levels.In perusing mine rece', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/chris-coyiers-favorite-codepen-demos-iv', 0),
(284, 'Retrieve Headers with cURL', 'We all know the cURL is incredibly useful.  We can retrieve remote content with curl, post to a remote URL, and perform hundreds of other tasks.  One simple task that can be completed is simply retrieving basic response headers.  To test the robot indexing prevention header I added to the Mozilla Developer Network, I used one simple cURL command to grab all headers from an address.The cURL command is short and sweet:Said command provides a list that looks similar to:This command is helpful when ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/curl-headers', 0),
(285, 'POST Form Data with cURL', 'cURL is the magical utility that allows developers to download a URL\'s content, explore response headers, get stock quotes, confirm our GZip encoding is working, and much more.  One more great usage of cUrl for command line is POSTing form data to a server, especially while testing moderate to advanced form processing.  And just like other cURL commands, POSTing form data is incredibly simple.Start your cURL command with curl -X POST and then add -F for every field=value you want to add to the P', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/curl-post-file', 0),
(286, 'JavaScript Promise API', '\nThe JavaScript Promise API is awesome but can be made amazing with async and await!\nWhile synchronous code is easier to follow and debug, async is generally better for performance and flexibility. Why \"hold up the show\" when you can trigger numerous requests at once and then handle them when each is ready?  Promises are becoming a big part of the JavaScript world, with many new APIs being implemented with the promise philosophy. Let\'s take a look at promises, the API, how it\'s used!The XMLHttpR', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/promises', 0),
(287, 'Git Branch Autocompletion', 'Naming git branches is something most of us have down to a science.  My branch naming pattern is usually {issue number}-short-feature-description, though many developers prefer to lead with the description and end with the issue.Regardless of the pattern you use, having a feature like autocomplete can save you a lot of time typing or copy/pasting.  Here\'s how you can implement autocomplete for git branches!Start by downloading the git-completion.sh file from GitHub:Next, add the following to you', 'DavidWalsh', 'https://davidwalsh.name/demo/2020/02/git-autocomplete.gif', 'https://davidwalsh.name/git-branch-autocompletion', 0),
(288, 'Lazy Object Initialization', 'The Firefox DevTools underlying code, which is written with JavaScript and HTML, is a complex application.  Due to the complexity and amount of work going on, the DevTools team has done everything they can to load as little as possible.  Furthermore the team has a system of lazily importing and initializing objects when they\'re needed.  I\'ve taken a bit of time to reduce the initializer, let\'s take a look!The system relies on taking advantage of Object.defineProperty\'s get function to initialize', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/lazy-object-initialization', 0),
(289, '7 Essential JavaScript Functions', 'I remember the early days of JavaScript where you needed a simple function for just about everything because the browser vendors implemented features differently, and not just edge features, basic features, like addEventListener and attachEvent.  Times have changed but there are still a few functions each developer should have in their arsenal, for performance for functional ease purposes.The debounce function can be a game-changer when it comes to event-fueled performance.  If you aren\'t using ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/essential-javascript-functions', 0),
(290, '8 Digit Hex Colors', 'One of the most requested capabilities in my early days of web development was the ability to set opacity on elements and even PNG images without the need for browser-specific CSS or hacks.  Eventually we got native opacity support and even enjoyed rgba(), the ability to cite an opacity level with a color.While I loved the ability to provide an opacity with color using rgba(), the use of hexadecimal color had always been ingrained in me, which made the sudden need for rgba conversions annoying. ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/8-digit-hex', 0);
INSERT INTO `article` (`article_id`, `title`, `description`, `website`, `image_url`, `link_url`, `view_count`) VALUES
(291, 'fetch API', 'One of the worst kept secrets about AJAX on the web is that the underlying API for it, XMLHttpRequest, wasn\'t really made for what we\'ve been using it for.  We\'ve done well to create elegant APIs around XHR but we know we can do better.  Our effort to do better is the fetch API.  Let\'s have a basic look at the new window.fetch method, available now in Firefox and Chrome Canary.XHR is a bit overcomplicated in my opinion, and don\'t get me started on why \"XML\" is uppercase but \"Http\" is camel-cased', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/fetch', 0),
(292, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/drag-zindex.php', 0),
(293, 'CSS Animations Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/css/animations', 0),
(294, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/dojo-nudge.php', 0),
(295, 'Search', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/?s=search', 0),
(296, 'Six Tiny But Awesome ES6 Features', 'Everyone in the JavaScript community loves new APIs, syntax updates, and features -- they provide better, smarter, more efficient ways to accomplish important tasks.  ES6 brings forth a massive wave of new goodies and the browser vendors have worked hard over the past year to get those language updates into their browser.  While there are big updates, some of the smaller language updates have put a massive smile on my face; the following are six of my favorite new additions within the JavaScript', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/es6-features', 0),
(297, 'Welcome to My Office', 'For many developers their office is their home away from home -- hell, some developers are at that office more often than they\'re at home.  For that reason most of us take great pride in our offices, keeping them as tidy (...or not) as we\'d like and injecting as much personality and comfort in said office as possible.  Whether it\'s a home office, cube, or coworking space, we need it to be pleasing to us for the sake of good work environment and sanity.I get asked about my office quite a bit so I', 'DavidWalsh', 'https://davidwalsh.name/demo/office-pics/pano.jpg', 'https://davidwalsh.name/office', 0),
(298, 'jQuery Link Nudging', 'A few weeks back I wrote an article about MooTools Link Nudging, which is essentially a classy, subtle link animation achieved by adding left padding on mouseover and removing it on mouseout.  Here\'s how to do it using jQuery:It\'s important to keep the nudge small and quick, so I set the animation to 20 pixels over 400 milliseconds.', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/jquery-link-nudging', 0),
(299, 'Drag and Drop Z-Index Stacking', 'In an example for a previous post, I showed you how to use opacity during a drag\'n\'drop transaction.  One bit I didn\'t account for was element stacking and bringing the most recent element to the top of the stack.  To do so, we\'ll need to use a variable that represents the highest zIndex, which we\'ll be incrementing.As you probably expected, the process is as simple as it gets.  Correct stacking order is incredibly important as you don\'t want items to be wrongly buried.', 'DavidWalsh', 'https://davidwalsh.name/demo/drag-opacity.jpg', 'https://davidwalsh.name/drag-drop-stacking', 0),
(300, 'CSS Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/css', 0),
(301, 'Link Nudging Using Dojo', 'In the past we\'ve tinkered with link nudging with MooTools and link nudging with jQuery.  In an effort to familiarize myself with other JavaScript frameworks, we\'re going to try to duplicate that effect with another awesome framework:  Dojo.Once the DOM is ready, we use the dojo.query method to find all of the links to nudge.  For every link we find, we record its original left padding and add mouseenter and mouseleave events to each link to animate its left padding.Dojo lead Pete Higgins showed', 'DavidWalsh', 'https://davidwalsh.name/demo/dojo-logo.jpg', 'https://davidwalsh.name/link-nudging-dojo', 0),
(302, 'Firefox OS Phone Unboxing', 'I may work at Mozilla but I was just as giddy as anyone to get my Firefox OS device.  I was able get one of the first test driver phones last year but there\'s something special about getting a finished (well, launch) product.  Here are a few photos of my joyous unboxing of the Firefox OS Keon.', 'DavidWalsh', 'https://davidwalsh.name/demo/firefiox-os-unbox-1.jpg', 'https://davidwalsh.name/firefox-os-unboxing', 0),
(303, 'Mobile Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/mobile', 0),
(304, 'JavaScript Copy to Clipboard', '\"Copy to clipboard\" functionality is something we all use dozens of times daily but the client side API around it has always been lacking; some older APIs and browser implementations required a scary \"are you sure?\"-style dialog before the content would be copied to clipboard -- not great for usability or trust.  About seven years back I blogged about ZeroClipboard, a solution for copying content to the clipboard in a more novel way......and by novel way I mean using Flash.  Hey -- we all hate o', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/clipboard', 0),
(305, 'MooTools Link Nudging', 'Link nudging is the process of adjusting the padding on a link slightly to show a simple, tasteful \"jump\" when you place your mouse over a link.  The effect is magnified when mousing on and off a link quickly.  Here\'s the short snippet of code:Check out the links in my footer to see the effect.  Short and simple, right?Chris Coyier also uses this effect, and it just so happens we both implemented it a day apart.  Great minds think alike?', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/mootools-link-nudging', 0),
(306, 'Cache API', 'The awesome ServiceWorker API is meant to give developers a bit more control over what is and isn\'t cached, and how.  Sure we can play games with ETags and the like but doing it programmatically with JavaScript just feels better, more controllable.  As with every API, however, adding stuff to cache isn\'t just fun and games -- you have to do the cleanup work yourself too, and by \"cleanup work\" I mean having to delete cache.Let\'s have a look at how you can get caches, add and delete requests from ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/cache', 0),
(307, 'HTML5 download Attribute', 'I tend to get caught up on the JavaScript side of the HTML5 revolution, and can you blame me?  HTML5 gives us awesome \"big\" stuff like WebSockets, Web Workers, History, Storage and little helpers like the Element classList collection.  There are, however, smaller features in HTML5 that we can appreciate; one of those would be the new download attribute.  The download attribute allows you to set a separate file download name than the actual link endpoint itself.Place the download attribute on a l', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/download-attribute', 0),
(308, 'jQuery Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/jquery', 0),
(309, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/feed', 0),
(310, 'Land Your Dream Job with Vettery', 'Whether you\'re an experienced pro or someone new to the industry, finding a great job can be a scary, stressful process. Engineers and designers get inundated with Hacker Rank tests, portfolio requests, and a variety of other queries. Vettery improves the experience for free agents by creating an atmosphere where businesses reach out to you!Vettery is an online hiring marketplace that is changing the way people hire and get hired. We match job-seekers with thousands of inspiring startups, Fortun', 'DavidWalsh', 'https://davidwalsh.name/demo/vetterylogo.svg', 'https://davidwalsh.name/land-your-dream-job-with-vettery', 0),
(311, 'Check GZip Encoding with curl', 'Last week I detailed how I enabled gzip encoding on nginx servers, the same server software I use on this site.  Enabling gzip on your server exponentially improves the site load time, thus improving user experience and (hopefully) Google page ranks.  I implemented said strategy and used another website to check if the gzip encoding worked, but little did I know, you can use the curl utility check if the encoding update worked.  Here\'s how you can check if the gzip encoding worked:After executin', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/check-gzip', 0),
(312, 'Tutorials Page 2', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/page/2', 0),
(313, 'Follow Redirects with cURL', 'I love playing around with cURL.  There\'s something about loading websites via command line that makes me feel like some type of smug hacker, just like tweeting from command line does.I recently cURL\'d the Google homepage and saw the following:I found it weird that Google does the initial redirect but I still want to get the source of the Google homepage with cURL, as with any site that may do a redirect without you noticing.  Luckily it\'s just a single flag:The -L flag instructs cURL to follow ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/curl-follow-redirects', 0),
(314, 'Shell Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/shell', 0),
(315, 'Facebook Open Graph META Tags', 'It\'s no secret that Facebook has become a major traffic driver for all types of websites.  Nowadays even large corporations steer consumers toward their Facebook pages instead of the corporate websites directly.  And of course there are Facebook \"Like\" and \"Recommend\" widgets on every website.  One problem I\'ve always found with sharing URLs on Facebook is that you often have no control over the image and description text that accompany the URL.  Had I known about Facebook Open Graph API, I woul', 'DavidWalsh', 'https://davidwalsh.name/demo/facebook-developers-logo.png', 'https://davidwalsh.name/facebook-meta-tags', 0),
(316, 'David Walsh', 'My name is David Walsh.  I\'m a 33-year old web developer and software engineer from Madison, Wisconsin.  In the web world I\'m:In a past web life I was:I don\'t design the sites, I make them work.My expertise and interest lies in front-end technologies, including HTML/5, CSS, JavaScript (as well as frameworks like jQuery, MooTools, and Dojo Toolkit).  My server side skills revolve around PHP and Python.  I enjoy dabbling in mobile development and edge devices and environments.  I focus on open sou', 'DavidWalsh', '/demo/about-david-walsh.jpg', 'https://davidwalsh.name/about', 0),
(317, 'I’m an Impostor', 'This is the hardest thing I\'ve ever had to write, much less admit to myself.  I\'ve written resignation letters from jobs I\'ve loved, I\'ve ended relationships, I\'ve failed at a host of tasks, and let myself down in my life.  All of those feelings were very temporary -- they would be heart-breaking temporarily but within months I\'d have moved on.  There\'s one feeling, however, that I\'ve not been able to conquer during my professional career:  Impostor Syndrome.\"Impostor\" is a powerful word but tha', 'DavidWalsh', 'https://davidwalsh.name/demo/WalshTongues.jpg', 'https://davidwalsh.name/impostor-syndrome', 0),
(318, 'Latest Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/page/1', 0),
(319, 'Designing for Simplicity', 'Before we get started, it\'s worth me spending a brief moment introducing myself to you. My name is Mark (or @integralist if Twitter happens to be your communication tool of choice) and I currently work for BBC News in London England as a principal engineer/tech lead; and I\'m also the author of \"Pro Vim\".Quick shout out to Steven Jack who took the time to review this post. A lot of what we\'ve done right, he either helped instigate or was a fundamental part of its successThe \"responsive\" BBC News ', 'DavidWalsh', 'https://davidwalsh.name/demo/design-for-simplicity/Bad-Architecture.png', 'https://davidwalsh.name/designing-simplicity', 0),
(320, 'David Walsh Blog - Home', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'http://davidwalsh.name/', 0),
(321, 'Demos Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/demos/page/2', 0),
(322, 'Vibration API', 'Many of the new APIs provided to us by browser vendors are more targeted toward the mobile user than the desktop user.  One of those simple APIs the Vibration API.  The Vibration API allows developers to direct the device, using JavaScript, to vibrate in a pattern for a given duration.It\'s always good to check for the presence of API support before using it;  here\'s how you can detect the Vibration API\'s presence:The Vibration API consists of only one method provided to the window.navigator obje', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/vibration-api', 0),
(323, 'currencylayer:  Simple, Effective Currency Conversion', 'Every developer that\'s maintained an eCommerce site will tell you that being responsible for properly handling currency will tell you it can be a very stressful task.  If you write buggy or insecure code, you\'re going to cost either your employer or the user money.  An added complication for developers can be currency conversion if the app caters to an international audience.  The last thing developers need is a complicated API, especially one that aids them in handling currency.  That\'s where c', 'DavidWalsh', 'https://davidwalsh.name/demo/currencylayer.gif', 'https://davidwalsh.name/currencylayer', 0),
(324, 'How to Test Firefox OS Apps on TV', 'One of my responsibilities in my new role in Partner Engineering at Mozilla is testing HTML5-powered apps and games on Panasonic televisions.  The television in my office, a beautiful 60\" 4K Ultra HD beast, is the perfect device for the job.  But how do I get the app from my local computer to the television for testing?  This blog post will walk you through the process of testing your HTML5 app on Firefox OS-powered televisions.It\'s important to note before we get started that using the browser ', 'DavidWalsh', 'https://davidwalsh.name/demo/WebIDEPackageLoad.png', 'https://davidwalsh.name/firefox-tv', 0),
(325, 'Create Short Preview from Video', 'I reference an adult video (porn) site in this post.  We\'re all grown ups, please do not be offended.Displaying a preview image before loading a video is common practice with web media these days; oftentimes that image preview is the video\'s first frame or an important frame from the video.  If you\'ve visited an adult site recently (ahem), you will have noticed that not only do you get a preview image but hovering over said image shows a small sample video with snippets at different points of th', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/video-preview', 0),
(326, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/textboxlist.php', 0),
(327, 'Create Screenshots from Videos', 'The idea behind my Get the First Frame of an Animated GIF with ImageMagick post was to improve a page\'s performance by not loading an animated GIF automatically, but instead grab the first frame, display it, and allow users to \"click to activate\" the GIF.  That strategy would save on load time as well as GPU.  The best solution for animated GIFs was ImageMagick but what\'s best for video?  The answer is ffmpeg.  The following commands will allow you to export images (screen or frame shots) from a', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/create-screenshots-videos', 0),
(328, 'Spatial Navigation', 'Spatial navigation is the ability to navigate to focusable elements based on their position in a given space.  Spatial navigation is a must when your site or app must respond to arrow keys, a perfect example being a television with directional pad remote.  Firefox OS TV apps are simply HTML5 wrapped in a chromeless browser shell (Gecko) so most apps require spacial navigation to ensure the physical television remote is useful.  Mozilla\'s Luke Chang has created SpatialNavigation to make implement', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/spatial-navigation', 0),
(329, 'Simple Image Lazy Load and Fade', 'One of the quickest and easiest website performance optimizations is decreasing image loading.  That means a variety of things, including minifying images with tools like ImageOptim and TinyPNG, using data URIs and sprites, and lazy loading images.  It\'s a bit jarring when you\'re lazy loading images and they just appear out of nowhere which is why I love the fading in route.  The page still shuffles if you aren\'t explicitly setting image dimensions but the fade in does provide a tiny bit of clas', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/lazyload-image-fade', 0),
(330, 'FileReader API', 'As broadband speed continues to get faster, the web continues to be more media-centric.  Sometimes that can be good (Netflix, other streaming services), sometimes that can be bad (wanting to read a news article but it has an accompanying useless video with it).  And every social service does anything it can to display an image with any user upload.One thing I hated about working with user-provided files was having to host them on a server somewhere:  the uploaded files take up disk space and in ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/filereader', 0),
(331, 'Google Extension Effect with CSS or jQuery or MooTools JavaScript', 'Both of the two great browser vendors, Google and Mozilla, have Extensions pages that utilize simple but classy animation effects to enhance the page.  One of the extensions used by Google is a basic margin-top animation to switch between two panes:  a graphic pane and a detail pane.  I\'ve taken a few moments to duplicate that effect with just CSS, and another enhanced version with jQuery and MooTools.I\'m using minimal elements within this code since, theoretically, there would be many of these ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/google-extension-effect', 0),
(332, 'Firefox OS Media Query', 'Firefox OS is an awesome new HTML5-based mobile operating system.  Some would says it\'s epic, I just think it\'s...super epic.   The \"native\" languages are HTML, CSS, and JavaScript -- it\'s enough to make a Web Developer weep.  Anyways, it\'s important to know how to target currently released Firefox OS devices with CSS media queries.  Here\'s how!The Firefox OS base media query (for popular released devices) is actually that of a common small mobile phone:This media query accommodates for both lan', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/firefox-os-media-query', 0),
(333, 'Tutorial Topics', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/topics', 0),
(334, 'dat.gui:  Exceptional JavaScript Interface Controller', 'We all love trusted JavaScript frameworks like MooTools, jQuery, and Dojo, but there\'s a big push toward using focused micro-frameworks for smaller purposes. Of course, there are positives and negatives to using them.  Positives include smaller JS footprint (especially good for mobile) and less cruft, negatives being that they don\'t have the community behind them to drive growth and the developer that uses multiple micro-frameworks has to work with inconsistent APIs.  To each their own;  I don\'t', 'DavidWalsh', 'https://davidwalsh.name/demo/dat-gui.png', 'https://davidwalsh.name/dat-gui', 0),
(335, 'HTML5 Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/html5/page/2', 0),
(336, 'Firefox OS Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/firefoxos/page/2', 0),
(337, 'Awesome File Compression and Delivery with KeyCDN and Brotli', 'I\'ve seen the KeyCDN name around for years, mostly as a free content delivery network (CDN) for many open source JavaScript frameworks, and based on that alone I\'ve always thought very well of them.  KeyCDN recently asked me to check out one of their latest features:  Brotli support.  Let\'s take a look at Brotli compression, how KeyCDN supports Brotli, and how you can get started making your website much faster in a matter of minutes!Brotli, a newer compression algorithm created by Google, allow', 'DavidWalsh', 'https://logos.keycdn.com/keycdn-logo.svg', 'https://davidwalsh.name/keycdn-brotli', 0),
(338, 'TextboxList for MooTools and jQuery by Guillermo Rauch', 'I\'ll be honest with you:  I still haven\'t figured out if I like my MooTools teammate Guillermo Rauch.  He\'s got a lot stacked up against him.  He\'s from Argentina so I get IM\'ed about 10 times a day about how great Lionel Messi is.  He lives in California so he doesn\'t have to deal with 3 months of bitter cold like I do in Madison.  He even takes some of my chicks.  All that said...he\'s just...just...so damn smart.  In the end I think some of my bitterness about Guiller is that he\'s smarter than', 'DavidWalsh', 'https://davidwalsh.name/demo/textboxlist.png', 'https://davidwalsh.name/mootools-jquery-textbox-list', 0),
(339, 'Chris Coyier’s Favorite CodePen Demos', 'Chris Coyer\'s incredible CodePen is much more than your typical code\'n\'share site.  CodePen features the end result more than the code, provides loads of collaboration tools, and seems to be pushing new features every week.  But what does Chris think of the user work being done on CodePen?  I\'ve asked Chris to share his favorite pens -- enjoy!David asked me if I\'d be up for a guest post picking out some of my favorite Pens from CodePen. A daunting task! There are so many! I managed to pick a few', 'DavidWalsh', 'https://davidwalsh.name/demo/codepenLogo.png', 'https://davidwalsh.name/chris-coyiers-favorite-pens', 0),
(340, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/wavesurfer.php', 0),
(341, 'Web Audio API', 'The Web Audio API allows developers to load and decode audio on demand using JavaScript.  The more I evaluate awesome games for Firefox OS TVs, the more I get to learn about these APIs that I normally wouldn\'t touch.  The following is a very basic introduction to the WebAudio API, often used for JavaScript games or apps allowing modification of audio on the front end.Let\'s start with a reduced Web Audio API code sample:I\'ve tried to comment within the code to describe the process as best as poss', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/web-audio-api', 0),
(342, 'Chris Coyier: Some Amazing Work on CodePen III', 'I\'m back! David asked me to rope up some of my favorite stuff on CodePen again, which I both love doing, and wince at the thought of having to pick so few favorites. I like a ton of stuff on CodePen. It\'s kind of a hobby of mine. Here\'s some things that appeal to my particular tastes ;)There are no shortage of hamburgers on CodePen, but this one by Bennett Feely (a transformation of a Dribble Shot by vlbrsk) is exceptionally clever. Bennet is always doing really clever stuff!See the Pen 3D Hambu', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/codepen-animations', 0),
(343, 'Dynamic Waveform Visualizations with wavesurfer.js', 'Waveform images are an awesome addition to boring audio widgets.  They can be functional as well as aesthetically pleasing, allowing users to navigate audio visually.  I recently found wavesurfer.js, an amazing waveform image utility that uses to Web Audio API to create super customizable waveform visualizations that take only a minute to implement.Start by including wavesurfer.js in your page:Create an instance of WaveSurfer, passing the element\'s selector and other configuration options:Lastly', 'DavidWalsh', 'https://davidwalsh.name/demo/waveformjs.png', 'https://davidwalsh.name/wavesurfer', 0),
(344, 'Create an Image Preview from a Video', 'Visuals are everything when it comes to media.  When I\'m trying to decide whether to watch a video on Netflix, it would be awesome to see a trailer of some kind, but alas that isn\'t available.  When I\'m looking to download a video on my computer, it\'d be awesome to have one single, condensed preview image which has thumbnails of every {x} seconds/minutes of the video to see whether it\'s worth watching.  I was sniffing around to find an app or easy way to do it but couldn\'t find anything, but I d', 'DavidWalsh', 'https://davidwalsh.name/demo/jack-slow.gif', 'https://davidwalsh.name/create-image-preview-video', 0),
(345, 'Features Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/features/page/2', 0),
(346, 'Reverse Element Order with CSS Flexbox', 'CSS is becoming more and more powerful these days, almost to the point where the order of HTML elements output to the page no longer matters from a display standpoint -- CSS lets you do so much that almost any layout, large or small, is possible.  Semantics and accessibility aside, I was recently hoping to find out if you could render elements in reverse order using only CSS, since in previous years we\'d need to shift the DOM aroundLet\'s assume we have the following HTML:Depending upon whether y', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/css-reverse', 0),
(347, 'ping Attribute', 'One of the attributes I somehow missed with the HTML5 revolution was the ping attribute;  Other attributes were more popular, download being one of them.  Hell, I just stumbled upon the ping attribute while reading an old forum post.  The ping attribute of an a element represents a list of URLs to POST to when the link is clicked.A sample usage of the ping attribute would look as follows:I tried writing the POST data to file but the PHP $_POST array was empty, so I can only assume no data is pas', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/ping-attribute', 0),
(348, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/css-left-ellipsis.php', 0),
(349, 'Regular Expressions for the Rest of Us', 'Sooner or later you\'ll run across a regular expression. With their cryptic syntax, confusing documentation and massive learning curve, most developers settle for copying and pasting them from StackOverflow and hoping they work. But what if you could decode regular expressions and harness their power? In this article, I\'ll show you why you should take a second look at regular expressions, and how you can use them in the real world.Why bother with regular expressions at all? Why should you care?Th', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/regular-expressions-rest', 0),
(350, 'Detect Supported Video Formats with JavaScript', 'Over the past few years we\'ve been seeing new audio, video, and image formats take shape to challenge the legacy formats that we\'ve used since the web\'s inception.  This is a great development as we have more processing power and better compression algorithms have been developed, leading to faster load times and rendering.  Hooray for speed!The problem:  as with every other features added to the browser, some browsers get media format support faster than others, and some browsers refuse to suppo', 'DavidWalsh', 'https://davidwalsh.name/demo/ChromeVideoSupport.png', 'https://davidwalsh.name/detect-supported-video-formats-javascript', 0),
(351, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/css-gradient.php', 0),
(352, 'Get Element Dimensions After CSS Transform', 'I\'ve been playing a lot with meta viewports recently due to seeing many HTML5 TV apps coded explicitly for 1280x720 which you\'ll see on many HD televisions.  We all know that it\'s a much better practice to use responsive design than hardcode dimensions but, that aside, meta viewports are meant to do the scaling.  So it\'s CSS transforms, specifically scale(), to the rescue.In creating a meta viewport shim, I needed to calculate an element\'s dimensions after it had been scaled.  Properties like cl', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/get-element-dimensions-css-transform', 0),
(353, 'Detect Supported Audio Formats with JavaScript', 'As streaming becomes our main entertainment source and vendors fight to create the best video format, it\'s going to be more and more important that we detect device and browser video support before posting videos on our websites.  We think less about audio but the same principle applies:  detect whether or not a given audio format is supported before using it.  So how do we detect if a given audio type is supported?We can detect audio format support with HTMLAudioElement.prototype.canPlayType, t', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/detect-supported-audio-formats-javascript', 0),
(354, 'Mozilla, Web Virtual Reality, and A-Frame', 'I was fortunate enough to make Game Developer Conference this year and the big story was virtual reality.  Hell, you couldn\'t go five feet without seeing someone pitching their VR hardware, software, or likewise technology.  They were all proprietary solutions, including Oculus, Epic Games, and so on.  You know that Mozilla, however, would provide a VR solution but in the most webby, open way possible:  the WebVR spec.  Along with trying to create an open standard for virtual reality, Mozilla ha', 'DavidWalsh', 'https://davidwalsh.name/demo/mozilla-virtual-reality-firefox-oculus-rift.jpg', 'https://davidwalsh.name/web-vr', 0),
(355, 'Remove Mobile Firefox Button Gradient', 'If you have an Android device, you\'ve gotta check out Firefox for Android.  It\'s an outstanding mobile browser -- it has been very well received and you can even install apps from the Firefox Marketplace from within this awesome browser.  One usability practice implemented by Firefox for Android is a gradient shade on all button elements.  While I appreciate the idea, I don\'t necessarily want this added to elements which I want to look a very specific way.  Removing this gradient effect is simpl', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/remove-mobile-firefox-button-gradient', 0),
(356, 'Dijit’s TabContainer Layout:  Easy Tabbed Content', 'One of Dojo\'s major advantages over other JavaScript toolkits is its Dijit library.  Dijit is a UI framework comprised of JavaScript widget classes, CSS files, and HTML templates.  One very useful layout class is the TabContainer.  TabContainer allows you to quickly create a tabbed content layout with minimal effort.  Keep reading to see what you can create in just 10 minutes!The first piece of HTML requires grabbing the required CSS theme files and adding the theme name as a class to the BODY t', 'DavidWalsh', 'https://davidwalsh.name/demo/dojo-tabs.jpg', 'https://davidwalsh.name/dojo-tabs', 0),
(357, 'HTML5 Video Player Best Practices', 'Let\'s all be honest:  when it comes to media and the early days of the internet, we definitely did it all wrong.  We started with embedded video players like RealPlayer and Windows Media Player which required custom codecs and browser plugins, then moved on to Flash and Quicktime -- all of which made our browsers slow and sometimes even at risk from a security perspective.  It took more than a decade to create a <video> tag and actually get browser support for it -- far too long of a wait, so mu', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/html5-video', 0),
(358, 'Geeksphone Peak Firefox OS Unboxing', 'Any time you get a new device it\'s like instant Christmas.  Whether it\'s top of the line or bottom of the barrel, we\'re always excited to check out unique devices to see what we can learn, check out what apps are popular, and test the websites we work on.  My latest devices is a Geeksphone Peak.  The following are images from my joyous unboxing.', 'DavidWalsh', 'https://davidwalsh.name/demo/firefoxos-peak/1.jpg', 'https://davidwalsh.name/geeksphone-peak-unboxing', 0),
(359, 'JavaScript Canvas Image Conversion', 'At last week\'s Mozilla WebDev Offsite, we all spent half of the last day hacking on our future Mozilla Marketplace app.  One mobile app that recently got a lot of attention was Instagram, which sold to Facebook for the bat shit crazy price of one billion dollars.  Since I wouldn\'t mind having a bill in my back account, I decided to create an Instagram-style app (which I\'ll share with you in the future).  This post details how you can convert an image to canvas and convert a canvas back to an ima', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/convert-canvas-image', 0),
(360, 'Image Lazy Loading', 'Lazy loading images is a practice that\'s been popular for a decade and for good reason: images are usually the heaviest downloads on a given webpage and avoiding unloading images that are never seen saves the user bandwidth. There are plugins for lazy loading images in every JavaScript framework, or you could use Intersection Observer API, but it\'s become such a common practice that there should probably be a browser API to accommodate it...and Chrome is implementing just that.  Let\'s have a loo', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/loading-lazy', 0),
(361, 'Hot Effect: MooTools Drag Opacity', 'As you should already know, the best visual features of a website are usually held within the most subtle of details.  One simple trick that usually makes a big different is the use of opacity and fading.  Another awesome MooTools functionality is dragging.  Why not double the awesomeness of Element dragging by adding fading?The code itself is quite simple -- we use Drag.Move\'s onStart and onComplete events to begin and end the fading.  We\'ve chosen to fade to the desired opacity level over a gi', 'DavidWalsh', 'https://davidwalsh.name/demo/drag-opacity.jpg', 'https://davidwalsh.name/mootools-drag-opacity', 0),
(362, '5 Awesome New Mozilla Technologies You’ve Never Heard Of', 'My trip to Mozilla Summit 2013 was incredible.  I\'ve spent so much time focusing on my project that I had lost sight of all of the great work Mozillians were putting out.  MozSummit provided the perfect reminder of how brilliant my colleagues are and how much of a n00b I really am.  I\'m willing to bet you\'ve not heard of these excellent projects, but you certainly should take a moment to explore them and be blown away!The Shumway project is an effort in parsing and rendering SWF files natively w', 'DavidWalsh', 'https://togetherjs.com/images/site-hero-image@2x.png', 'https://davidwalsh.name/mozilla-technologies', 0),
(363, 'Turn Your Web Application into a Firefox OS App in 5 Minutes', 'One of the promises that comes with HTML5 mobile apps, especially those to be featured on Firefox OS, is that your existing web applications, if created properly (feature detection, responsive design, etc.), can be turned into a working mobile application in relatively little time.  And that\'s the way it should be, right?  If my app works in the device\'s browser, shouldn\'t it work perfectly as a standalone app?  Let\'s say you have a responsive, well-written website/app and you want to let Firefo', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/firefox-app', 0),
(364, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/sheen-effect.php', 0),
(365, 'Create Custom Video Player Controls with CanJS', 'In this guide, you will learn how to create a custom video player using the <video> element and CanJS. The\ncustom video player will:The final player looks like:The following sections are broken down into the following parts:START THIS TUTORIAL BY Forking THE FOLLOWING CodePen:Click the Edit in CodePen button.  The CodePen will open in a new window. Click the Fork button.', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/custom-html5-video', 0),
(366, 'JavaScript Battery API', 'The Battery API has been updated; read JavaScript Battery API Update to see the new code pattern!Mozilla Aurora 11 was recently released with a bevy of new features.  One of those great new features is their initial implementation of the Battery Status API.  This simple API provides you information about the battery\'s current charge level, its charging status, and allows you to be notified of changes via a few events.  Let\'s check it out!The battery object is located at window.navigator.battery,', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/battery-api', 0),
(367, 'Create a Sheen Logo Effect with CSS', 'I was inspired when I first saw Addy Osmani\'s original ShineTime blog post.  The hover sheen effect is simple but awesome.  When I started my blog redesign, I really wanted to use a sheen effect with my logo.  Using two HTML elements and a CSS transition, I was able to create my own sheen effect.  Let\'s do it!The following image is the same used by Addy:Larger than what I need but it can be cut down if needed.Two elements will be used for the sheen effect:  one element as the wrapper and an inne', 'DavidWalsh', 'https://davidwalsh.name/demo/sheen-effect.jpg', 'https://davidwalsh.name/sheen-effect', 0),
(368, 'CSS Rounded Corners', 'The ability to create rounded corners with CSS opens the possibility of subtle design improvements without the need to include images.  CSS rounded corners thus save us time in creating images and requests to the server.  Today, rounded corners with CSS are supported by all of the major browsers:  Safari, Chrome, Internet Explorer, Opera, and Firefox.  Let\'s look at border-radius syntax, caveats, and Internet Explorer support.The CSS3 standard property for applying rounded corners is border-radi', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/css-rounded-corners', 0),
(369, 'How to Get and Set CSS Variable Values with JavaScript', 'CSS variables are a very welcome addition to the language, despite them being incredibly basic.  Sure we could use SASS or stylus but languages should never count on developers relying on frameworks and toolkits to accomplish what we know we need.  And just like every other part of a webpage, you can get and manipulate CSS variable values -- let\'s check out how!The traditional method of using native CSS variables is adding it to root:Simple.  Also remember that CSS variables are nowhere near as ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/css-variables-javascript', 0),
(370, '9 Mind-Blowing Canvas Demos', 'The <canvas> element has been a revelation for the visual experts among our ranks.  Canvas provides the means for incredible and efficient animations with the added bonus of no Flash; these developers can flash their awesome JavaScript skills instead.  Here are nine unbelievable canvas demos that will make your jaw drop!The Zen Photon Garden demo is the epitome of mind-blowing.  This epic canvas demo allows for drawing on the canvas with reactive light streams, allowing the user to see the end p', 'DavidWalsh', 'https://davidwalsh.name/demo/canvas-zen.jpg', 'https://davidwalsh.name/canvas-demos', 0),
(371, 'CSS Gradients', 'With CSS border-radius, I showed you how CSS can bridge the gap between design and development by adding rounded corners to elements.  CSS gradients are another step in that direction.  Now that CSS gradients are supported in Internet Explorer 8+, Firefox, Safari, and Chrome, we can safely implement them in our websites.  Let\'s look at the basics of CSS gradients:  their syntax, browser support, and fallbacks.Gradients provide a method to, over a customizable amount of space, transition from one', 'DavidWalsh', 'https://davidwalsh.name/demo/css-gradients.png', 'https://davidwalsh.name/css-gradients', 0),
(372, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/prefers-color-scheme.php', 0),
(373, 'Introducing MooTools LinkAlert', 'One of my favorite Firefox plugins is called LinkAlert.  LinkAlert shows the user an icon when they hover over a special link, like a link to a Microsoft Word DOC or a PDF file.  I love that warning because I hate the surprise of opening a PDF file.  The problem with LinkAlert in its current state is that it\'s only available with Firefox...until now.  Armed with my favorite JavaScript library, MooTools, I\'ve duplicated the functionality of LinkAlert.Options for LinkAlert include:Events for LinkA', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/mootools-link-alert', 0),
(374, 'Write Simple, Elegant and Maintainable Media Queries with Sass', 'I spent a few months experimenting with different approaches for writing simple, elegant and maintainable media queries with Sass. Each solution had something that I really liked, but I couldn\'t find one that covered everything I needed to do, so I ventured into creating my own: meet include-media.I started off with this basic list of requirements:So, basically, I wanted something like this:Let\'s get to it then.The first step is to come up with a structure where we can define our breakpoints and', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/sass-media-query', 0),
(375, 'MooTools Typewriter Effect Plugin', 'Last week, I read an article in which the author created a typewriter effect using the jQuery JavaScript framework. I was impressed with the idea and execution of the code so I decided to port the effect to MooTools.  After about an hour of coding, I had a smooth, customizable Mootools class that accomplished the same goal.  Without further adieu, here\'s my MooTools 1.2 Typewriter plugin.Once the class is initialized, options get set (also note the class defaults).  Once the start method is call', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/mootools-typewriter', 0),
(376, 'Send Text Messages with PHP', 'Kids these days, I tell ya.  All they care about is the technology.  The video games.  The bottled water.  Oh, and the texting, always the texting.  Back in my day, all we had was...OK, I had all of these things too.  But I still don\'t get the volume of texts that I hear my younger female cousins send.  Thousands and thousands of them each month.  WTF are all of these texts for?  Here\'s a thought:omg did you hear?no wutomg i can\'t believe you didn\'t hearlol tell me!', 'DavidWalsh', 'https://davidwalsh.name/demo/sms-text.png', 'https://davidwalsh.name/send-text-message', 0),
(377, 'Create Namespaced Classes with MooTools', 'MooTools has always gotten a bit of grief for not inherently using and standardizing namespaced-based JavaScript classes like the Dojo Toolkit does.  Many developers create their classes as globals which is generally frowned up.  I mostly disagree with that stance, but each to their own.  In any event, namespaces are technically just nested objects and I recently shared with you how to create and retrieve nested objects with MooTools.  With those utility functions available, I\'ve modified Class ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/namespace-mootools', 0),
(378, 'Prevent Robot Indexing with Response Headers', 'Every so often you have parts of your website that would be better off not indexed by search engines.  API calls, search result pages, PDF documents -- all examples of responses which may not have value outside of the current user.  No we all know we can signal to the search engines not to index pages using a META tag, but oftentimes service calls and documents don\'t get the luxury of a META tag.  Luckily you can add a header to prevent these responses from being indexed.The header name is X-Rob', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/prevent-robot-index', 0),
(379, 'Python Decorator for Preventing Robot Indexing', 'Much of my time at Mozilla has been spent catching up to the rest of the MDN team with respect to python.  The new MDN backend, codenamed Kuma, is entirely Django-based and has been a joy to learn.  My latest python adventures have been focused on increasing MDN\'s SEO score, a task which includes telling Google not to index given pages.  In doing so, I created my first view decorator:  a decorator that sends a response header which prevents a robot from indexing the given page.The first step is ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/python-decorator', 0),
(380, 'The Parallax SEO Conundrum', 'This post touches on the parallax SEO issue and offers solutions to fix it. If you\'re following the trends in web design at least from time to time, you probably know that parallax scrolling is one of the cool things that are all the rage as we speak. It does not look that the trend will go anywhere any time soon. That said, you need to make sure that you use every web design trend with caution. Otherwise you may go belly up one day just because people stopped finding you in Google.If you are in', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/parallax-seo-conundrum', 0),
(381, 'Do / Undo Functionality with MooTools', 'We all know that do/undo functionality is a God send for word processing apps.  I\'ve used those terms so often that I think of JavaScript actions in terms of \"do\" an \"undo.\"  I\'ve put together a proof of concept Do/Undo class with MooTools.Once you\'ve created your class instance you need to register your do\'s/undo\'s by providing a key, do function, undo function, and your arguments.  From then on out you just call doo and undo methods, providing the key of course, to make it happen.This do/undo ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/do-undo', 0),
(382, 'Change Category Slug within WordPress', 'When I first started this blog, I set the category \"slug\" to \"sugar.\"  Why sugar?  Because a lot of a good thing is candy;  thus, a bunch of MooTools tutorials is as sweet as sugar.  While I get a giggle out of calling my categories sugar, Google doesn\'t find it nearly as funny, nor does Yahoo or Bing.  In an effort to increase my SEO, I wanted to change my category slug to \"tutorials.\"  That\'s where the awesome Redirection plugin and a simple regular expression comes into place.You can very eas', 'DavidWalsh', 'https://davidwalsh.name/demo/wordpress-category-slug.jpg', 'https://davidwalsh.name/wordpress-category-slug', 0),
(383, 'From Webcam to Animated GIF: the Secret Behind chat.meatspac.es!', 'My team mate Edna Piranha is not only an awesome hacker; she\'s also a fantastic philosopher! Communication and online interactions is a subject that has kept her mind busy for a long time, and it has also resulted in a bunch of interesting experimental projects that have fostered an unexpected community and tons of spontaneous collaboration, plus have helped unearth a browser bug or two!We could spend hours just going through her list of projects and getting amazed by all the ways in which she\'s', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/webcam-animated-gif', 0),
(384, 'Create a 3D Panorama Image with A-Frame', 'In the five years I\'ve been at Mozilla I\'ve seen some awesome projects.  Some of them very popular, some of them very niche, but none of them has inspired me the way the MozVR team\'s work with WebVR and A-Frame project have.A-Frame is a community project aiming to be \"building blocks for the virtual reality web\", a library for creating VR experiences within the browser using markup or JavaScript.  Jumping into using a project like this can be overwhelming so let\'s start simple:  creating an inte', 'DavidWalsh', 'https://davidwalsh.name/demo/aframe-large.png', 'https://davidwalsh.name/3d-panorama-image', 0),
(385, '9 More Mind-Blowing WebGL Demos', 'With Firefox OS, asm.js, and the push for browser performance improvements, canvas and WebGL technologies are opening a world of possibilities.  I featured 9 Mind-Blowing Canvas Demos and then took it up a level with 9 Mind-Blowing WebGL Demos, but I want to outdo those with this post.  I\'ve found nine more mental WebGL demos that you shouldn\'t miss.  Enjoy!This incredible demo is as fluid as you could believe.  Raise and drop the ball into the water to see realistic, beautiful splashing of the ', 'DavidWalsh', 'https://davidwalsh.name/demo/webgl-water.jpg', 'https://davidwalsh.name/webgl-demo', 0),
(386, 'Prevent Page Zooming in Mobile Browsers', 'Ever since I got my iPhone, I\'ve been more agreeable in going places that my fiancee wants to go.  It\'s not because I have any interest in checking out women\'s shoes, looking at flowers, or that type of stuff -- it\'s because my iPhone lets me surf the web the whole time...or until my iPhone\'s tiny battery dies.  It wasn\'t until recently that I noticed that some sites don\'t allow the user to zoom in and out of a page.  After some research I found that preventing page zooming was as easy as adding', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/zoom-mobile-browsers', 0);
INSERT INTO `article` (`article_id`, `title`, `description`, `website`, `image_url`, `link_url`, `view_count`) VALUES
(387, '9 Mind-Blowing WebGL Demos', 'As much as developers now loathe Flash, we\'re still playing a bit of catch up to natively duplicate the animation capabilities that Adobe\'s old technology provided us.  Of course we have canvas, an awesome technology, one which I highlighted 9 mind-blowing demos.  Another technology available for intense web animation is WebGL. WebGL brings a whole new dimension to canvas animation and gaming. Here are nine jaw-dropping demos which will restore your faith in client-side vector graphic animation.', 'DavidWalsh', 'https://davidwalsh.name/demo/webgl-maze.jpg', 'https://davidwalsh.name/webgl-demos', 0),
(388, 'Fixing mod_rewrite and .htaccess on GoDaddy Hosting', 'I recently launched a new website on GoDaddy shared hosting.  The website required mod_rewrite for SEO-friendly URLs.  GoDaddy provides mod_rewrite but every time I tried to hit a two-deep URL, I would get a 404 error.  Here\'s what I had:The fix to this problem was to add the following directive before my mod_rewrite directives:Tada!  The URLs began working and the website\'s SEO has taken off!', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/mod_rewrite-htaccess-godaddy', 0),
(389, 'CSS Background Animations', 'Background animations are an awesome touch when used correctly.  In the past, I used MooTools to animate a background position.  Luckily these days CSS animations are widely supported enough to rely on them to take over JavaScript-based animation tasks.  The following simple CSS snippet animates the background image (via background position) of a given element.We\'ll use CSS animations instead of transitions for this effect:With the animation code in place, now it\'s time to apply it to an element', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/background-animation-css', 0),
(390, 'Background Animations Using MooTools', 'Updated 4/25/2011:  The background animation has been updated to work well with Internet Explorer 7 and 8, and more efficiently with every other browser.  This was accomplished by adding the wait property to the animation, and using an initial setStyle assignment to work around an IE8 background-position bug.One of the sweet effects made easy by JavaScript frameworks like MooTools and jQuery is animation.  I ran across this great jQuery tutorial that walks you through animating a background imag', 'DavidWalsh', 'https://davidwalsh.name/demo/bg-clouds.jpg', 'https://davidwalsh.name/mootools-animate-background', 0),
(391, 'Pure CSS Slide Up and Slide Down', 'If I can avoid using JavaScript for element animations, I\'m incredibly happy and driven to do so.  They\'re more efficient, don\'t require a JavaScript framework to manage steps, and they\'re more elegant.  One effect that is difficult to nail down with pure CSS is sliding up and down, where the content is hidden when \"up\" and slides in when \"down\".  The reason it\'s difficult is because you may not know the content height.  After playing around with different CSS properties, I\'ve found a way to mak', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/css-slide', 0),
(392, 'How to Change the WordPress Media Upload Directory', 'One thing I\'ve always missed about the \"old\" way of web development was the simplicity of FTP. No deploy scripts, no fuss: simple drag and drop of files and the files are there. I\'ve used FTP for assets on this blog for over a decade but I\'m finally ready to be lazy enough to want to drag images into WordPress and use them as WordPress intended.The problem is that I want the files to upload to custom directory, not the wp-content/uploads directory that WordPress defaults to.  The following PHP s', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/wordpress-upload', 0),
(393, 'Write Better JavaScript with Promises', 'You\'ve probably heard the talk around the water cooler about how promises are the future. All of the cool kids are using them, but you don\'t see what makes them so special. Can\'t you just use a callback? What\'s the big deal? In this article, we\'ll look at what promises are and how you can use them to write better JavaScript.Let\'s say we want to grab some data from the HipsterJesus API and add it to our page. This API responds with data that looks like this:Using a callback, we\'d write something ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/write-javascript-promises', 0),
(394, 'How to Change the WordPress Admin Login Logo', 'There are numerous content management systems that thrive these days but none are as prolific as WordPress. Every client wants the ability to change their website at a moment\'s notice and they want to do it themselves, and again, WordPress is the best fit for that. You fit the client with WordPress, customize it with plugins for the features they need, and give them the login URL...where they would see a WordPress logo...which cheapens the work you\'ve done. Going the extra mile to customize the ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/change-wordpress-logo', 0),
(395, 'Add META Tags to WordPress Head', 'The reason that WordPress is so developer-friendly is their awesome hook system.  Depending on a post category (or seemingly anything else), you can modify the contents of the page, the theme templates, and everything else.  WordPress is amazing.One recent use case I had was wanting to modify the <meta name=\"robots\" content=\"{index? follow?}\"> tag based on the post\'s category:  if the post is in category A, use noindex,nofollow, otherwise use index,follow.  After all not every post is a reflecti', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/wordpress-add-meta-tags', 0),
(396, 'WordPress Publish Post Hook', 'One of the best parts of WordPress is its hook/action system; this special hook system is WordPress\' way of assigning callbacks when certain events occur.  One event that there seems to be a lot of confusion over is which hook to use to detect when a post is initially published.  There\'s the publish_post hook but that fires when you click the \"Update\" button after a post has already been published; that\'s not ideal.Scour the WordPress documentation and forums and you\'re sure to see a dozen other', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/wordpress-publish-post-hook', 0),
(397, 'Prevent WordPress from Loading “Next” Pages', 'I\'ve been working to make this blog more performant by lazy loading everything I can think of, placing CSS and JavaScript into the HTML, and using data URIs;  the common theme in these is reducing the number of requests on each page.  One request I noticed (and hadn\'t anticipated) coming from WordPress looked like this:Wordpress was essentially preloading the second listing page of my blog, assuming that people would click a link to page 2.  When looking at my blog stats, that was very rarely th', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/prevent-wordpress-loading-pages', 0),
(398, 'Using DOMDocument to Modify HTML with PHP', 'One of the first things you learn when wanting to implement a service worker on a website is that the site requires SSL (an https address).  Ever since I saw the blinding speed service workers can provide a website, I\'ve been obsessed with readying my site for SSL.  Enforcing SSL with .htaccess was easy -- the hard part is updating asset links in blog content.  You start out by feeling as though regular expressions will be the quick cure but anyone that has experience with regular expression kno', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/domdocument', 0),
(399, 'Add Custom CSS to WordPress Admin', 'Believe it or not, I spend an awful lot of time going through my blog\'s comments and correcting spelling issues, code formatting, etc.; yes, even the comments from way back to 2007.  It\'s mostly for quality control purposes and ease of reading for my readers, especially the code comments.One gripe I have with WordPress\' admin section is that it\'s difficult to spot <pre> tag contents, especially code samples that are only one line.  It made me think: \"wouldn\'t it be awesome if I could add my own ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/add-custom-css-wordpress-admin', 0),
(400, 'Serve a Directory with PHP', 'Many developers have a giggle at PHP, even looking down at the language, but let\'s be honest:  most of our blogs are powered by it (WordPress) and it\'s a great language to dabble around with.  I cut my teeth on PHP, though I prefer to avoid PHP these days.But when I need to experiment with a simple PHP coding task for the sake of a blog feature, I look for the simplest possible serving solution to accomplish that feat.  Luckily PHP provides me a quick solution for testing:The command above allow', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/serve-directory-php', 0),
(401, 'WordPress Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/wordpress/page/2', 0),
(402, 'Preventing Bot Attacks on WordPress using No Captcha reCaptcha', 'There are many different solutions to prevent bots from submitting web forms; one of the most popular solutions is reCaptcha. reCaptcha actually displays an image with some text in it and user has to enter the text to submit the form successfully. It was difficult for bots to read the text on the image, but as bots algorithms become more advanced, they started breaking this security. It was no more safe. This old method is pretty bad in terms of user friendliness. Then Google created a new reCap', 'DavidWalsh', 'http://qnimate.com/wp-content/uploads/2015/01/hero-recaptcha-demo.gif', 'https://davidwalsh.name/preventing-bot-attacks-wordpress-captcha-recaptcha', 0),
(403, 'Improving WordPress Commenting with Postmatic', 'We\'ve set out to create a fantastic commenting plugin for WordPress. It\'s called Postmatic and what it does is a first for any blogging system: to allow synchronous 100% email and web-based commenting. The web folks can engage via the web. The email folks can stick to email. And everyone can remain focused, engaged, and most important: at their own pace.But WordPress has a spam problem. Which means that sooner or later, if we aren\'t paying attention, we\'re going to have one as well. Or even wors', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/improving-wordpress-commenting-postmatic', 0),
(404, '', '', 'DavidWalsh', 'https://davidwalsh.name/wp-content/themes/punky/images/logo.png', 'https://davidwalsh.name/demo/vertical-center-flexbox.php', 0),
(405, '', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/demo/lightface.php', 0),
(406, 'Creating Scrolling Parallax Effects with CSS', 'I generally dislike ESPN because they\'re the McDonalds of sports news but they recently did a piece on Luis Suarez that was eye-catching.  The content itself was great but their use of parallax and imagery was outstanding.  They\'ve employed this technique in a few of their features now and I\'ve been so impressed that I implored my readers to write about how it\'s done.  The following is a post principally written by Stefan Judis with detail added by myself.  Enjoy!For quite a long time now websit', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/parallax', 0),
(407, 'Using MooTools to Instruct Google Analytics to Track Outbound Links', 'Google Analytics provides a wealth of information about who\'s coming to your website.  One of the most important statistics the service provides is the referrer statistic -- you\'ve gotta know who\'s sending people to your website, right?  What about where you send others though?  Using MooTools 1.2, you can direct Google Analytics\' pageTracker to track outbound link clicks.Here\'s what you would see on your \"Top Exit Pages\" within Google Analytics:Excellent!  Who knew it would be so easy?', 'DavidWalsh', 'https://davidwalsh.name/demo/outgoing.jpg', 'https://davidwalsh.name/mootools-google-analytics-track-outbound-links', 0),
(408, 'MooTools Flashlight Effect', 'Another reason that I love Twitter so much is that I\'m able to check out what fellow developers think is interesting. Chris Coyier posted about a flashlight effect he found built with jQuery.  While I agree with Chris that it\'s a little corny, it is a neat effect so I ported it over to MooTools.What\'s really impressive about this effect is how little code is involved.  While I wouldn\'t recommend this for a commercial website, it doesn\'t have some fun value.', 'DavidWalsh', 'https://davidwalsh.name/demo/flashlight.jpg', 'https://davidwalsh.name/mootools-flashlight', 0),
(409, 'Custom Getters and Setters with MooTools', 'Working with Dojo all day and scoping out MooTools at night gives me a unique perspective;  I get to constantly evaluate the two frameworks and mentally move functionalities from framework to framework.  One small but handy feature within the Dojo Toolkit\'s Dijit UI Framework is its set/get system.  Dijit allows developers to add custom methods tied into simple get and set methods to allow manipulation properties into and on the way out of a class.  I took a few moments to implement this system ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/get-set', 0),
(410, 'Function Debouncing with Underscore.js', 'The ability to listen and react to user interactions with JavaScript is fundamental and incredibly useful.  Some interactions happen frequently and some rarely.  Some listener functions are light of action, others can be quite taxing on the browser.  Take window\'s resize event for example:  the event fires at each step in the resize, so if you have a taxing event listener, your user\'s browser will get bogged down quickly.Obviously we can\'t allow the user\'s browser to get bogged down, but we can\'', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/function-debounce', 0),
(411, '5 Best Practice Mentalities to Get Over', 'Every developers strives to write clean, maintainable, and functional code, whether they hack on the server side or dabble on the client side.  Over the last few decades of the web, we\'ve learned from some of our early mistakes and formed a site of always changing best practices.  These best practices usually keep us out of trouble but some of them are taken way too literally, to the point where developers become too rigid and borderline crippled by them.  Truth be told, with these best practice', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/get-over', 0),
(412, 'Mobile Touch Events in MooTools 1.3', 'The release of MooTools 1.3 brings about a vast array of new functionality to the JavaScript framework.  One big new addition to MooTools Core is the ability to detect mobile events:  touchstart, touchmove, touchend, touchcancel, gesturestart, gesturechange, gestureend, and  orientationchange.  Let me show you how to listen for and react to each of these mobile events using the new MooTools touch/gesture functionality with the traditional MooTools event listener syntax!There are four different t', 'DavidWalsh', 'https://davidwalsh.name/demo/iphone-front.jpg', 'https://davidwalsh.name/mootools-touch', 0),
(413, 'JavaScript Coding with Class', 'I\'ve spent the last two weeks in London, eating fish\'n\'chips, drinking cup\'o\'tea, and being a hooligan at the Arsenal.  Oh yeah, there was a MooTools hackathon too.  The MooTools hackathon was hugely successful and I\'ll be providing more detail about what was accomplished and where MooTools is going over the coming weeks.  It was also great to meet some of the development team in person instead of simple IRC.  MooTools FTW!Another exciting part of my time in London was presenting at London Ajax.', 'DavidWalsh', 'https://davidwalsh.name/demo/london_ajax_logo.gif', 'https://davidwalsh.name/javascript-coding-class', 0),
(414, 'Determining Object Type with MooTools’ typeOf', 'One thing about JavaScript I dislike is the vagueness of what the typeof operator returns.  Pass typeof an array?  You get \"object\" back (which it is, but a more concise answer would be helpful).  Pass typeof a Date object?  You get \"object\" again.  What if there was a better way of determining an object\'s descriptive type?  That\'s where the typeOf function within MooTools Core comes into play.The typeOf function is actually quite short:typeOf checks for specific properties on the object in ques', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/mootools-typeof', 0),
(415, 'MooTools Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/mootools/page/2', 0),
(416, 'Page Visibility API', 'One event that\'s always been lacking within the document is a signal for when the user is looking at a given tab, or another tab.  When does the user switch off our site to look at something else?  When do they come back?  The Page Visibility API allows developers to react to changes in page visibility via the visibilitychange document event.  New document.hidden and document.visibilityChange properties are also available.This new document property, document.hidden, returns true the page is curr', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/page-visibility', 0),
(417, 'MooTools Mobile: It’s Touching!', 'When the community asked the MooTools team to add basic mobile event listening to MooTools\' Event class, we listened;  today MooTools supports all touch and gesture events.  What if we want more detailed mobile event listeners though, like swipe with direction, pinch, or touchhold events?  That\'s where Christoph Pojer\'s excellent MooTools Mobile comes in.  MooTools Mobile isn\'t a full mobile framework, but rather a set of utilities to make catering to mobile a bit more...touching.  Let\'s have a ', 'DavidWalsh', 'https://davidwalsh.name/demo/ipads.png', 'https://davidwalsh.name/mootools-mobile-touching', 0),
(418, 'Introducing MooTools Templated', 'One major problem with creating UI components with the MooTools JavaScript framework is that there isn\'t a great way of allowing customization of template and ease of node creation.  As of today, there are two ways of creating:The first way to create UI-driven widgets with MooTools is creating numerous elements programmatically.  The following snippet is taken from my MooTools LightFace plugin:The problem with creating elements programmatically within widgets is that doing so means your class be', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/templated', 0),
(419, 'LightFace:  Facebook Lightbox for MooTools', 'One of the web components I\'ve always loved has been Facebook\'s modal dialog.  This \"lightbox\" isn\'t like others:  no dark overlay, no obnoxious animating to size, and it doesn\'t try to do \"too much.\"  With Facebook\'s dialog in mind, I\'ve created LightFace:  a Facebook lightbox clone for MooTools.  LightFace and its family of classes work well with iFrames, images, AJAX-requested content, static positioning, and static content.LightFace has a lot of backed in goodness!LightFace.js is the core pi', 'DavidWalsh', 'https://davidwalsh.name/demo/lightface.png', 'https://davidwalsh.name/facebook-lightbox', 0),
(420, 'Select Dropdowns, MooTools, and CSS Print', 'I know I\'ve harped on this over and over again but it\'s important to enhance pages for print.  You can do some things using simple CSS but today\'s post features MooTools and jQuery.  We\'ll be taking the options of a SELECT element and generating a list in case the user prints the page.Just a normal select list, nothing special.Simple -- show the generated options DIV only during print.The script grabs every SELECT element in the page and generates a list of the SELECT\'s options -- it even notes ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/print-select-options', 0),
(421, '6 Things You Didn’t Know About Firefox OS', 'Firefox OS is all over the tech news and for good reason:  Mozilla\'s finally given web developers the platform that they need to create apps the way they\'ve been creating them for years -- with CSS, HTML, and JavaScript.  Firefox OS has been rapidly improving, adding features and APIs to provide device control and other standard mobile functionality.  Much is not known about Firefox OS, however, and here are a few items you may find interesting!Everyone knows that the components of Firefox OS ar', 'DavidWalsh', 'https://davidwalsh.name/demo/firefox-phone.png', 'https://davidwalsh.name/firefox-os', 0),
(422, 'Sara Soueidan’s Favorite CodePen Demos', 'One of the awesome developers I recently caught on to is Sara Soueidan.  Her tutorials about SVG have been top class and she\'s taught me a lot about the excellence that is SVG.  Since she\'s one of my SVG heroes, I thought it would be awesome to have her pick out some of her favorite CodePen demos.  Enjoy!A few months ago, Chris Coyier shared his favorite CodePen demos right here on David\'s blog. A while back David asked me to share some of my favorite pens too, so here are some of the demos that', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/sara-soueidans-favorite-codepen-demos', 0),
(423, 'Custom Configuration for Phabricator', 'Phabricator is an excellent code review tool used by Facebook and other respected software engineering organizations.  The user interface is beautiful, the workflow and tools are concise and comprehensive, and it\'s a utility that covers most use cases, both web and command line.  I\'ve written a many Phabricator extensions and I\'ve found that creating a single configuration extension to be used by other extensions is of great utility.  Let\'s look at how easy it is to create your own custom config', 'DavidWalsh', 'https://d27urz3c38hyx4.cloudfront.net/res/corgi/15fbb9a3/images/phabricator/hero.png', 'https://davidwalsh.name/phabricator-config', 0),
(424, 'Retrieve Custom Field Values for Phabricator Objects', 'Phabricator is an incredibly well-coded PHP application but lacks a bit on the documentation side.  Then again, what open source project isn\'t?  Over the past months I\'ve been slowly integrating Phabricator, a newish review tool, with Bugzilla, a much older tool.  The most recent step saw me needing to add a custom field (DifferentialCommitMessageCustomField class extension) to revisions:\n\nCreating the DifferentialCommitMessageCustomField extension was fairly simple but, due to the structure of ', 'DavidWalsh', 'https://davidwalsh.name/demo/phabricator-bmo-bug-id.png', 'https://davidwalsh.name/custom-field-values', 0),
(425, 'Add CSS and JavaScript Files to Phabricator Extensions', 'Every open source framework has its own methods of extending functionality; some make extending incredibly easy and others...not so much.  Most of the time it comes down to how well the framework is documented.  Phabricator did an awesome job of making necessary classes extendable but it\'s fair to say it would be great if the framework had a bit better documentation (PRs welcome, I bet!).In creating my own extension, I needed to add JavaScript and CSS files to the page.  Unfortunately the Adding', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/add-css-javascript-files-phabricator-extensions', 0),
(426, 'Match Special Letters with PHP Regular Expressions', 'Regular expressions come with all sorts of peculiarities, one of which I recently ran into when creating a regex within PHP and preg_match.  I was trying to parse strings with the format \"Real Name (:username)\" when I ran into a problem I would see a lot at Mozilla:  my regular expression wasn\'t properly catching \"special\" or \"international\" letters, like à, é, ü, and the dozens of others.My regular expression was using A-z in the real name matching piece of the regex, which I assumed would matc', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/letters-regex', 0),
(427, 'Create Auth Tokens with PHP', 'Working with OAuth and similar authentication protocols requires the use of temporary tokens which represent unique handshakes between multiple web services.  These tokens must be unique, securely stored, and the longer, the better.Since I\'ve been out of the PHP game for a while, I was researching how to create such tokens without additional libraries.  The following snippet does the trick:If you aren\'t using PHP7 or above, you can fallback to the following:Having the backing of OpenSSL for toke', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/random_bytes', 0),
(428, 'PHP: Get POST JSON', 'My recent work at Mozilla has me creating an OAuth-like authentication transaction between Bugzilla and Phabricator.  This task has thrust me back into the world of PHP, a language I haven\'t touched much (since version ~5.2) outside of creating WordPress themes and plugins for this blog.  Coming back to a language you haven\'t touched in years feels like a completely new experience; you notice patterns and methods that you wouldn\'t have guessed of in years past.Part of the authentication transact', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/php-json', 0),
(429, 'Get a Single Header with cURL', 'Debugging third party apps can be difficult for a variety of reasons.  You take for granted that the third party has not only properly coded their app but that their server is also serving files properly.  As more a developer than a sysadmin I tend to spend a long time on the code before I ensure the server stuff is correct.  One mistake often made on the server side is not sending correct Content-Type headers with content, especially audio and video files, and that can cause a real problem for ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/curl-get-header', 0),
(430, 'PHP Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/php/page/2', 0),
(431, 'Get Stock Quotes From Command Line', 'When I conned my way into my first professional programming gig, I didn\'t really think much about money -- just that I was getting my foot in the door.  But as my career has gone on, I\'ve been more aware of money, investing, and retirement.  I\'ve recently regretfully gotten into stock trading -- you can imagine how many times a day I hit the ole F5 to see updated quotes, praying my investments push higher.I also spend a large part of my day in iTerm, so switching back and forth between the brows', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/stock-quotes-command-line', 0),
(432, 'Phabricator AphrontRequest / Save Error Fix', 'Working on Phabricator extensions has thrust me back into the world of PHP, a language I had only touched via WordPress plugins and blog themes over the past few years.  Despite being away from the language, I was able to jump back in fairly quickly and felt a small \"back at home\" comfort...until I realized Phabricator was not greatly documented and that I\'d need to dive deep into the source code to figure out how to do just about every task.One error that baffled me for a while was the followin', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/aphrontrequest-error', 0),
(433, 'Download a URL’s Content Using PHP cURL', 'Downloading content at a specific URL is common practice on the internet, especially due to increased usage of web services and APIs offered by Amazon, Alexa, Digg, etc.  PHP\'s cURL library, which often comes with default shared hosting configurations, allows web developers to complete this task.Alternatively, you can use the file_get_contents function remotely, but many hosts don\'t allow this.', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/curl-download', 0),
(434, 'Get Browser Information with Intern', 'You know how you can\'t remember something your spouse feels is really important but you can remember every funny line from that movie you saw when you were 17?  That\'s how I feel after months of writing selenium tests using the Intern framework -- I\'ve forgotten lots of important front-end stuff but I\'ve uncovered loads of selenium issues and techniques to hack around them.I initially wrote my tests using Firefox as the test browser.  Then I opened up my testing to Chrome and needed to adjust a ', 'DavidWalsh', 'https://davidwalsh.name/demo/lebowski-fuck-it.gif', 'https://davidwalsh.name/browser-name-intern', 0),
(435, 'Loading Static Templates for Intern Testing', 'I use Intern by SitePen for all of my JavaScript functional testing.  Intern has loads of features other functional test frameworks don\'t and it\'s completely Promise-based -- something I got very used to when I used the Dojo Toolkit every day. Async test creation can be difficult but I find it very rewarding.While writing destructive tests for the Mozilla Developer Network, I decided I wanted to load specific content to test.  The first step is adding a new file with the sample content alongside', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/loading-static-template-intern-testing', 0),
(436, 'Observing Intersection Observers', '\n    Intersection Observers have the goal of providing \"a way to asynchronously observe changes in the intersection of a target element with an ancestor element or with a top-level document\'s viewport.\" This will allow sites to lazy-load images and other media, render and remove DOM on demand as we would need for a million-row grid, and provide infinite scrolling as we may see in a social network feed.\n  \n    But Intersection Observers also solve a bigger problem not immediately obvious to us as', 'DavidWalsh', 'https://davidwalsh.name/demo/intersectionobserver/observer.png', 'https://davidwalsh.name/intersection-observers', 0),
(437, 'Dojo Tutorials', '', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/tutorials/dojo/page/2', 0),
(438, 'Dojo DeferredList', 'Deferreds are all the rage in the JavaScript community these days and who can argue?  Deferreds, an object representing an asynchronous action, make working with AJAX requests incredibly easy -- no callback hell, no problem passing request information around.  What if you want to work with multiple Deferreds though?   For example, say you want to execute functionality once multiple AJAX requests complete.  The Dojo Toolkit has you covered with dojo/DeferredList, a resource whose API mirrors a si', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/deferredlist', 0),
(439, 'Resize an Image Using Canvas, Drag and Drop and the File API', 'It\'s a massive honor to have Tom \"Trenkavision\" Trenka write a guest post for this blog.  Tom was one of the original contributors of the Dojo Toolkit and my mentor at SitePen.  I\'ve seen his genius first hand and he\'s always the first one to foresee issues with a potential solution.  He also thinks outside the box, coming up with unconventional but reliable solutions to edge case problems.  This is a perfect example.\nRecently I was asked to create a user interface that allows someone to upload ', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/resize-image-canvas', 0),
(440, 'File Uploads and C:\\fakepath\\', 'I was recently working on a project that required providing an AJAX uploading widget to users.  I decided to use Dojo\'s dojox.form.FileInput widget so the \"Upload\" button would look just like every other button within the web application.  Everything worked great until I tested the widget in Chrome and found that the value of the input node was being set to C:\\fakepath\\{Original File Name}.  I then checked Internet Explorer and Safari;  both of them were prepending \"C:\\fakepath\" to the file name', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/fakepath', 0),
(441, 'Dojo, Dijit, Dropdowns, and _aroundNode', 'The Dojo Toolkit\'s awesome UI framework, Dijit, has loads of awesome widgets to allow developers to quickly create themed, feature-rich web applications.  Dijit provides form widgets, layout widgets, dropdown-based widgets, and much more.  What\'s nice about Dijit is that there\'s so much functionality provided that you don\'t need to code everything yourself.  The down side of that?  That it can be difficult to find the undocumented pieces of functionality required to accomplish your goal.One case', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/dijit-dropdowns', 0),
(442, 'Using dojo/aspect', 'Simply put:  the Dojo Toolkit has tools that other JavaScript toolkits don\'t.  One of those tools includes Dojo 1.7\'s aspect, a module that allows developers to react to function calls by executing another function before or after that call.  This aspect resource originates from Dojo\'s awesome connect mechanism. Let\'s check out how it works!The idea and value of aspect is that it allows you to be notified of function calls without needing to modify the original function\'s contents.  You also don', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/dojo-aspect', 0),
(443, 'Clone Anything with JavaScript', 'One topic or concept that causes confusion when developers start with JavaScript is the idea of passing objects by reference;  for example, setting two variables equal to the same object actually creates a reference to that same object.  Sending an object to a function and modify that argument within the function actually modifies the original object.  Sometimes we\'d prefer to send around a clone of something, a date, array, or maybe an object literal.  The Dojo Toolkit provides an excellent met', 'DavidWalsh', 'public/images/imagenotfound.png', 'https://davidwalsh.name/javascript-clone', 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES
(1, 9),
(2, 30),
(3, 36),
(4, 41),
(129, 10),
(130, 10),
(131, 10),
(132, 10),
(133, 10),
(134, 10),
(135, 10),
(136, 10),
(137, 10),
(138, 10),
(139, 10),
(140, 10),
(141, 10),
(142, 10),
(143, 10),
(144, 10),
(145, 10),
(146, 10),
(147, 10),
(148, 10),
(149, 10),
(150, 10),
(151, 10),
(152, 10),
(153, 10),
(154, 10),
(155, 10),
(156, 10),
(157, 10),
(158, 10),
(159, 10),
(160, 10),
(161, 10),
(162, 10),
(163, 10),
(164, 10),
(165, 10),
(166, 10),
(167, 10),
(168, 10),
(169, 10),
(170, 10),
(171, 10),
(173, 10),
(172, 10),
(174, 10),
(175, 10),
(177, 10),
(176, 10),
(178, 10),
(181, 10),
(182, 10),
(180, 10),
(179, 10),
(183, 10),
(187, 10),
(184, 10),
(186, 10),
(185, 10),
(188, 10),
(189, 10),
(190, 10),
(191, 10),
(192, 10),
(193, 10),
(194, 10),
(195, 10),
(197, 10),
(196, 10),
(198, 10),
(199, 10),
(200, 10),
(201, 10),
(202, 10),
(203, 10),
(204, 10),
(205, 10),
(208, 10),
(207, 10),
(206, 10),
(209, 10),
(210, 10),
(211, 10),
(213, 10),
(212, 10),
(214, 10),
(215, 10),
(216, 10),
(217, 10),
(218, 10),
(219, 10),
(221, 10),
(220, 10),
(222, 10),
(223, 10),
(224, 10),
(225, 10),
(227, 10),
(226, 10),
(228, 10),
(229, 10),
(230, 10),
(231, 10),
(232, 10),
(233, 10),
(234, 10),
(235, 10),
(236, 10),
(237, 10),
(238, 10),
(239, 10),
(240, 10),
(241, 10),
(242, 10),
(243, 10),
(244, 10),
(245, 10),
(246, 10),
(247, 10),
(248, 10),
(249, 10),
(250, 10),
(251, 9),
(252, 9),
(253, 9),
(254, 9),
(255, 9),
(256, 9),
(257, 9),
(258, 9),
(259, 9),
(260, 9),
(261, 9),
(262, 9),
(263, 9),
(264, 9),
(265, 9),
(266, 9),
(267, 9),
(268, 9),
(269, 9),
(270, 9),
(271, 9),
(272, 9),
(273, 9),
(274, 9),
(275, 9),
(276, 9),
(277, 9),
(278, 9),
(279, 9),
(280, 9),
(281, 9),
(282, 9),
(283, 9),
(284, 9),
(285, 9),
(286, 9),
(287, 9),
(288, 9),
(289, 9),
(290, 9),
(291, 9),
(292, 9),
(293, 9),
(294, 9),
(295, 9),
(296, 9),
(297, 9),
(298, 9),
(299, 9),
(300, 9),
(301, 9),
(302, 9),
(303, 9),
(304, 9),
(305, 9),
(306, 9),
(307, 9),
(309, 9),
(308, 9),
(310, 9),
(311, 9),
(312, 9),
(314, 9),
(313, 9),
(315, 9),
(316, 9),
(317, 9),
(318, 9),
(319, 9),
(320, 9),
(321, 9),
(322, 9),
(323, 9),
(324, 9),
(325, 9),
(326, 9),
(327, 9),
(328, 9),
(329, 9),
(330, 9),
(331, 9),
(332, 9),
(333, 9),
(334, 9),
(335, 9),
(336, 9),
(337, 9),
(338, 9),
(339, 9),
(340, 9),
(341, 9),
(342, 9),
(343, 9),
(344, 9),
(345, 9),
(346, 9),
(347, 9),
(348, 9),
(349, 9),
(350, 9),
(351, 9),
(352, 9),
(353, 9),
(354, 9),
(355, 9),
(356, 9),
(358, 9),
(357, 9),
(359, 9),
(361, 9),
(360, 9),
(362, 9),
(363, 9),
(364, 9),
(365, 9),
(366, 9),
(367, 9),
(368, 9),
(369, 9),
(370, 9),
(371, 9),
(372, 9),
(373, 9),
(374, 9),
(375, 9),
(376, 9),
(377, 9),
(378, 9),
(379, 9),
(380, 9),
(381, 9),
(382, 9),
(383, 9),
(384, 9),
(385, 9),
(386, 9),
(387, 9),
(388, 9),
(389, 9),
(390, 9),
(391, 9),
(392, 9),
(393, 9),
(394, 9),
(395, 9),
(396, 9),
(397, 9),
(398, 9),
(399, 9),
(400, 9),
(401, 9),
(402, 9),
(403, 9),
(404, 9),
(405, 9),
(406, 9),
(407, 9),
(408, 9),
(409, 9),
(410, 9),
(411, 9),
(412, 9),
(413, 9),
(414, 9),
(415, 9),
(416, 9),
(417, 9),
(418, 9),
(419, 9),
(420, 9),
(421, 9),
(422, 9),
(423, 9),
(424, 9),
(425, 9),
(426, 9),
(427, 9),
(428, 9),
(429, 9),
(430, 9),
(431, 9),
(432, 9),
(433, 9),
(434, 9),
(435, 9),
(436, 9),
(437, 9),
(438, 9),
(439, 9),
(440, 9),
(441, 9),
(442, 9),
(443, 9);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`user_id`, `article_id`) VALUES
(4, 1),
(2, 140),
(2, 132);

-- --------------------------------------------------------

--
-- Table structure for table `hidden`
--

CREATE TABLE `hidden` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hidden`
--

INSERT INTO `hidden` (`user_id`, `article_id`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'public/images/profile.png',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `phone`, `bio`, `image_url`, `website`, `about`, `address`) VALUES
(2, 'Sarayu Gautam', '9813095820', 'FLutter Dev', 'public/uploads/profile1584179122379.jpg', 'www.sarayugautam.com', 'hello there how are you', 'Chandragiri');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'food and drink'),
(2, 'cooking'),
(3, 'music'),
(4, 'arts'),
(5, 'women'),
(6, 'anime'),
(7, 'stories'),
(8, 'environment'),
(9, 'programming'),
(10, 'general'),
(11, 'sports'),
(12, 'culture'),
(13, 'inspirational'),
(14, 'relationship'),
(15, 'books'),
(16, 'nutrition'),
(17, 'celebrities'),
(18, 'parenthood'),
(19, 'babies'),
(20, 'education'),
(21, 'travel'),
(22, 'humour'),
(23, 'writing'),
(24, 'interesting facts'),
(25, 'animals'),
(26, 'fitness'),
(27, 'beauty'),
(28, 'technology'),
(29, 'movies'),
(30, 'nature'),
(31, 'science'),
(32, 'business'),
(33, 'psychology'),
(34, 'history'),
(35, 'fashion and style'),
(36, 'economics'),
(37, 'mathematics'),
(38, 'philosophy'),
(39, 'health'),
(40, 'finance'),
(41, 'marketing'),
(42, 'television series'),
(43, 'literature'),
(44, 'journalism'),
(45, 'politics');

-- --------------------------------------------------------

--
-- Table structure for table `tag_website`
--

CREATE TABLE `tag_website` (
  `tag_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_website`
--

INSERT INTO `tag_website` (`tag_id`, `website_id`) VALUES
(9, 2),
(9, 11),
(21, 15),
(21, 4),
(9, 13),
(9, 12),
(27, 7),
(33, 8),
(21, 14),
(11, 1),
(27, 10),
(11, 3),
(8, 16),
(8, 17),
(1, 18),
(1, 19),
(33, 6),
(1, 21),
(7, 22),
(31, 23),
(31, 24),
(31, 25),
(31, 26),
(5, 27),
(43, 28),
(1, 20),
(43, 30),
(14, 31),
(9, 9),
(29, 33),
(45, 34),
(38, 35),
(44, 36),
(35, 37),
(12, 29),
(43, 39),
(28, 40),
(34, 32),
(6, 42),
(26, 43),
(19, 44),
(18, 45),
(24, 46),
(39, 38),
(40, 48),
(3, 49),
(22, 41),
(40, 47),
(36, 5),
(10, 50);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receive_notification` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `reset_token`, `receive_notification`, `created_at`, `updated_at`) VALUES
(2, 'sarayugautam1@gmail.com', '$2a$08$TrZ1iIyrtPNXCCHN609MleQEf3vzTi8bqnTKer5SgS4N9hB6mtLTu', '', 0, '2020-03-07 09:21:15', '2020-03-11 13:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tags`
--

INSERT INTO `user_tags` (`user_id`, `tag_id`) VALUES
(4, 24),
(4, 17),
(4, 18),
(4, 1),
(2, 41),
(2, 20),
(2, 23),
(2, 25),
(2, 9),
(2, 36),
(2, 10),
(2, 24);

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `website_id` int(11) NOT NULL,
  `link_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`website_id`, `link_url`) VALUES
(1, 'https://www.espn.in'),
(2, 'https://davidwalsh.name'),
(3, 'https://sports.yahoo.com'),
(4, 'https://misstourist.com'),
(5, 'https://www.theguardian.com/international'),
(6, 'https://www.mentalfloss.com'),
(7, 'https://www.beautytipsonline.com'),
(8, 'https://www.psychologytoday.com'),
(9, 'https://www.codewall.co.uk'),
(10, 'https://www.mindbodygreen.com'),
(11, 'https://webdevblog.com'),
(12, 'https://www.codingalpha.com'),
(13, 'https://hackernoon.com'),
(14, 'https://travelandtourismnow.blogspot.com'),
(15, 'https://abovethehimalaya.com'),
(16, 'https://www.treehugger.com'),
(17, 'https://www.huffpost.com'),
(18, 'https://iamafoodblog.com'),
(19, 'https://www.thegundruk.com'),
(20, 'https://pinchofyum.com'),
(21, 'https://www.seriouseats.com'),
(22, 'https://www.short-story.me'),
(23, 'https://www.howstuffworks.com'),
(24, 'https://www.sciencedaily.com'),
(25, 'https://www.popsci.com'),
(26, 'https://www.livescience.com'),
(27, 'https://www.bloodandmilk.com'),
(28, 'https://lithub.com'),
(29, 'https://www.newyorker.com/culture'),
(30, 'https://themillions.com'),
(31, 'https://www.loveisrespect.org/blogs'),
(32, 'https://www.smithsonianmag.com'),
(33, 'https://www.cinemablend.com/news'),
(34, 'https://thegeopolitics.com'),
(35, 'https://www.philosophyforlife.org/blog'),
(36, 'https://www.westernjournal.com'),
(37, 'https://www.fashionlady.in/category/fashion'),
(38, 'https://www.fashionlady.in/category/health-tips'),
(39, 'https://www.helpingwritersbecomeauthors.com'),
(40, 'https://arstechnica.com'),
(41, 'https://littleoldladycomedy.com'),
(42, 'https://www.cbr.com'),
(43, 'https://www.eatright.org'),
(44, 'https://www.healthychildren.org/English/ages-stages/baby'),
(45, 'https://bouncebackparenting.com'),
(46, 'https://www.thefactsite.com'),
(47, 'https://www.thepennyhoarder.com'),
(48, 'https://www.mrmoneymustache.com'),
(49, 'https://pitchfork.com'),
(50, 'https://en.wikipedia.org');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`website_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `website_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
