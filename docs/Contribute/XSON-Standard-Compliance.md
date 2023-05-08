# XSON Library Standardization

XSON standard-compliant libraries are those which follow a certain set of rules, intended to make them easy to use and understand by both developers and end users. In order for your library to meet this standard, you must:
- Explicitly list all extensions which you support. Any extension not listed is assumed to not be supported.
- Explicitly list all extension sets which you support and up to which version. You only need to list the latest version, as each version of an extension set is backwards-compatible with all previous versions. Any extension set not listed is assumed to not be supported.
- Not use generic or unhelpful error messages. CMake's generic [`invalid preset`](https://gitlab.kitware.com/cmake/cmake/-/issues/21310) error is a great example of what NOT to do. Overall, your error messages must be as clear and specific as possible.
- Explicitly give an error if a user tries to enable an extension or extension set that you do not support (that also means ones that you do not explicitly list as stated before), such as `MyParser does not support XLE-12!`. Do not use a generic "syntax error", as that is heavily misleading and goes against the previous rule as well.
- Be able to read any given file as an XSON file or XSON schema file regardless of the file extension.
- Be able to accept ANSI, UTF-8, UTF-16, and UTF-32 file encodings.
- Log or notify the user when an extension that is marked as deprecated is used (see the status field of [extensions]())
- Not start the name of your library with XSON (regardless of captialization), as that naming convention is reserved for [reference implementations]() (e.g. you cannot use XSON-Cpp or XsonRuby).

Libraries that are compliant with this standardization have the benefit of being able to be listed under the official list of [XSON Standard Compliant Libraries](). Library developers who follow the standard can request to be put in this list by opening an [issue]() on github with the appropriate template.