USE pubs;
/*
http://en.wikipedia.org/wiki/Regular_expression#POSIX_Basic_Regular_Expressions

Metacharacter	Description
.	Matches any single character (many applications exclude newlines, and exactly which characters are considered newlines is flavor-, character-encoding-, and platform-specific, but it is safe to assume that the line feed character is included). Within POSIX bracket expressions, the dot character matches a literal dot. For example, a.c matches "abc", etc., but [a.c] matches only "a", ".", or "c".
[ ]	A bracket expression. Matches a single character that is contained within the brackets. For example, [abc] matches "a", "b", or "c". [a-z] specifies a range which matches any lowercase letter from "a" to "z". These forms can be mixed: [abcx-z] matches "a", "b", "c", "x", "y", or "z", as does [a-cx-z].
The - character is treated as a literal character if it is the last or the first (after the ^) character within the brackets: [abc-], [-abc]. Note that backslash escapes are not allowed. The ] character can be included in a bracket expression if it is the first (after the ^) character: []abc].
[^ ]	Matches a single character that is not contained within the brackets. For example, [^abc] matches any character other than "a", "b", or "c". [^a-z] matches any single character that is not a lowercase letter from "a" to "z". As above, literal characters and ranges can be mixed.
^	Matches the starting position within the string. In line-based tools, it matches the starting position of any line.
$	Matches the ending position of the string or the position just before a string-ending newline. In line-based tools, it matches the ending position of any line.
BRE: \( \)
ERE: ( )	Defines a marked subexpression. The string matched within the parentheses can be recalled later (see the next entry, \n). A marked subexpression is also called a block or capturing group.
\n	Matches what the nth marked subexpression matched, where n is a digit from 1 to 9. This construct is theoretically irregular and was not adopted in the POSIX ERE syntax. Some tools allow referencing more than nine capturing groups.
*	Matches the preceding element zero or more times. 
	For example, ab*c matches "ac", "abc", "abbbc", etc. 
	[xyz]* matches "", "x", "y", "z", "zx", "zyx", "xyzzy", and so on. 
	\(ab\)* matches "", "ab", "abab", "ababab", and so on.
BRE: \{m,n\}
ERE: {m,n}	Matches the preceding element at least m and not more than n times. For example, a\{3,5\} matches only "aaa", "aaaa", and "aaaaa". This is not found in a few older instances of regular expressions.

http://devman.tistory.com/162

.at	matches any three-character string ending with "at", including "hat", "cat", and "bat".
[hc]at	matches "hat" and "cat".
[^b]at	matches all strings matched by .at except "bat".
^[hc]at matches "hat" and "cat", but only at the beginning of the string or line.
[hc]at$ matches "hat" and "cat", but only at the end of the string or line.
\[.\]	matches any single character surrounded by "[" and "]" since the brackets are escaped, for example: "[a]" and "[b]".

pattern0 = "[^가-힣]"  '한글만
pattern1 = "[^-0-9 ]"  '숫자만
pattern2 = "[^-a-zA-Z]"  '영어만
pattern3 = "[^-가-힣a-zA-Z0-9/ ]" '숫자와 영어 한글만 
pattern4 = "<[^>]*>"   '태그만
pattern5 = "[^-a-zA-Z0-9/ ]"    '영어 숫자만
*/

SELECT * FROM titles WHERE title REGEXP '.';	-- any single char
SELECT * FROM titles WHERE title REGEXP 'a';	
SELECT * FROM titles WHERE title REGEXP 'a.';	
SELECT * FROM titles WHERE title REGEXP 'computer';
SELECT * FROM titles WHERE title REGEXP '^a';
SELECT * FROM titles WHERE title REGEXP '^The';
SELECT * FROM titles WHERE title REGEXP 'cooking';
SELECT * FROM titles WHERE title REGEXP 'cooking$';

SELECT * FROM titles WHERE title REGEXP '[pol]';	
SELECT * FROM titles WHERE title REGEXP '[a-z]';	-- 해당 범위
SELECT * FROM titles WHERE title REGEXP '^[a-z]';
SELECT * FROM titles WHERE title REGEXP '^[a-z0-9]';
SELECT * FROM titles WHERE title REGEXP '[가-힣]';	-- 한글로 시작하는 것만
SELECT * FROM titles WHERE title REGEXP '[ㄱ-힣]';	-- 한글로 시작하는 것만
SELECT * FROM titles WHERE title REGEXP '^[ㄱ-힣0-9]';
SELECT * FROM titles WHERE title REGEXP 'comb*';
SELECT * FROM titles WHERE title REGEXP 'comb*a';
SELECT * FROM titles WHERE title REGEXP '^[0-9]';	-- 0-9로 시작
SELECT * FROM titles WHERE title REGEXP '^[A-z]';	-- A-z로 시작
SELECT * FROM titles WHERE title REGEXP '^S.';	-- Si, St로 시작
SELECT * FROM titles WHERE title REGEXP '^S[it].';	-- Si, St로 시작
SELECT * FROM titles WHERE title REGEXP '^S[^it].';	-- Si, St는 제외
SELECT * FROM titles WHERE title REGEXP '^[c]*.*de$';
SELECT * FROM titles;
