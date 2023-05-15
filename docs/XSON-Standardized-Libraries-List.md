Below is a list/table of [standard-compliant](#XSON-Library-Standardization) XSON libraries.
You will also find important definitions and information about XSON libraries in this document.

# XSON Library Standardization

XSON standard-compliant libraries are those which follow a certain set of rules, intended to make libraries easy to use and understand by both developers and end users. In order for your library to meet this standard, you must:
- Explicitly list all extensions which you support in at least your documentation. Any extension not listed means it is not supported.
- Explicitly list all extension sets which you support and up to which version. You only need to list the latest version, as each version of an extension set is backwards-compatible with all previous versions. Any extension set not listed means it is not supported.
- Not use generic or unhelpful error messages. CMake's generic [`invalid preset`](https://gitlab.kitware.com/cmake/cmake/-/issues/21310) error is a great example of what NOT to do. Overall, your error messages must be as clear and specific as possible.
- Explicitly give an error if a user tries to enable an extension or extension set that you do not support (that also means ones that you do not explicitly list as stated before), such as `MyParser does not support XLE-12!`. Do not use a generic "syntax error", as that is heavily misleading and goes against the previous rule as well.
- Be able to read any given file as an XSON file or XSON schema file regardless of the file extension.
- Be able to properly read and write with ANSI, UTF-8, UTF-16, and UTF-32 file encodings.
- Log or notify the user when an extension that is marked as deprecated is used (see the status field of [extensions](XSON-Extension-Document-Template))
- Not start the name of your library with XSON (regardless of captialization), as that naming convention is reserved for [reference implementations](#Reference-Implementations) (e.g. you cannot use XSON-Cpp or XsonRuby).

***All libraries in the below list are standard compliant***. The above rules are garaunteed to be true for any library in this list, so developers can rely on consistent behavior. 

Library developers who follow this standard can request to their libraries put on this list by opening an [issue](../issues) on github with the appropriate issue template. This of course means that said libraries need to be open source so they can be inspected for compliance. See the [Contribution Guidelines](Contribution-Guidelines) for more information.

# Reference Implementations
Reference implementations are XSON libraries that are created by the XSON developer(s) themselves. 
They are usually the first XSON library created for a programming language.

They are discerened by their names starting with "xson" (e.g. XsonCpp) regardless of capitalization.
They have the advantage of having advanced features and are very likely to support all current extensions and the newest extension sets.

They are also intended to be used as a reference for library developers to create their own library off of, 
since all reference implementations are open source and under a copy-left license.

# List of Libraries
**All libraries in this list are [standard-compliant](#XSON-Library-Standardization)**.

Libraries whose names are *italicized* are [reference implementations](#Reference-Implementations).

### C/C++
| Name                                              | Langauge Version      | License    | # of Extensions Supported | Author(s)                               | Notes   |
| -----------                                       | --------------------- | ---------- | ------------------------- | --------------------------------------- | ------- |
| [*XsonCpp*](https://github.com/xson-lang/XsonCpp) | C++17                 | GNU LGPLv3 | All<sup>1</sup>           | [Arastais](https://github.com/Arastais) |         |
| *XsonC*                                           | C99/C++               | GNU LGPLv3 | All<sup>1</sup>           | [Arastais](https://github.com/Arastais) | Planned |

### C#
| Name     | Langauge Version      | License    | # of Extensions Supported | Author(s)                               | Notes   |
| -------- | --------------------- | ---------- | ------------------------- | --------------------------------------- | ------- |
| *XsonCS* | C# 8.0                | GNU LGPLv3 | N/A                       | [Arastais](https://github.com/Arastais) | Planned | 

### Java
| Name        | Langauge Version      | License    | # of Extensions Supported | Author(s)                               | Notes   |
| ----------- | --------------------- | ---------- | ------------------------- | --------------------------------------- | ------- |
| *XsonJava*  | Java 21 LTS           | GNU LGPLv3 | N/A                       | [Arastais](https://github.com/Arastais) | Planned | 

### Python
| Name        | Langauge Version      | License    | # of Extensions Supported | Author(s)                               | Notes   |
| ----------- | --------------------- | ---------- | ------------------------- | --------------------------------------- | ------- |
| *XsonPy*    | Python 3.11           | GNU LGPLv3 | N/A                       | [Arastais](https://github.com/Arastais) | Planned | 

### Rust
| Name        | Langauge Version      | License    | # of Extensions Supported | Author(s)                               | Notes   |
| ----------- | --------------------- | ---------- | ------------------------- | --------------------------------------- | ------- |
| *XsonRust*  | N/A                   | GNU LGPLv3 | N/A                       | [Arastais](https://github.com/Arastais) | Planned |