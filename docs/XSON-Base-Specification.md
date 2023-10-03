
# Base Specification

> The base spec of XSON is currently in its ***alpha*** stage and subject to changes. After some feedback and refinement, it will be transitioned into a *beta* stage and eventually ratified into its full, final RFC release after further polishing and mass review.

There is only one standardized version of this base specification - no versioning.

## Table of Contents
- [Keys/Values](#KeysValues): Key/Value pairs make up the backbone of XSON files. Keys hold a value; A value can be an [Array](#Arrays), an [Object](#Objects), or a regular string
- [Type Interpretation](#Type-Interpretation): There are no types in XSON; values can be interpreted as any type. 
- [Arrays](#Arrays): Arrays are comma-separated collection of strings, enclosed by square brackets.
- [Objects](#Objects): Objects are collections of even more key/value pairs, enclosed by curly braces.
- [Directives](#Directives): Directives are used to denote special commands or behaviors to XSON via the preprocessor.
- [Comments](#Comments): Comments are ignored by XSON parsers and use C-like syntax; Single-line comments begin with two forward slashes, while multi-line comments begin with `/*` and end with `*/`. Everything in between is ignored.
- [Extensions](#Extensions): Extensions are optional features on top of the base specification of XSON. Each extension must be opted into using the `#ext` directive and its numerical ID.
- [Extension Sets](#Extension-Sets): Extension sets are curated and pre-defined collections of extensions that are named based on common functionality. You also must opt-in to extension sets using the `#extset` directive and its name.
- [Files](#Files): XSON has standardization for file extensions, line endings, encodings, and its internet media type that should be used.

## Keys/Values
[Key/Value pairs](https://en.wikipedia.org/wiki/Name%E2%80%93value_pair) are the bread and butter of XSON. 

A **key** is a string representing the name for the corresponding value.

Keys in XSON are separated from their values by the colon `:` character. Each key/value pair is separated by a [newline](#L100). Keys (and all strings for that matter) should not have quotes, and can have any amount of whitespace:
```java
key: value
my key: my value
```
<br/>

The first colon character read from left to right is used to separate the key from the value:
```xson
my : character: 0x3A 
```
In this example, `my` is the key while `character: 0x3A` is the value.

<br/>

Quotes around strings are treated as part of the value itself:
```xson
key1: "my value"
key2: my value
```
`key1` and `key2` do not have the same value here. `key1` evaluates to `"my value"`, while `key2` evaluates to `my value`.

<br/>

Keys must be unique and are case in-sensitive. Consider the following example:
```xson
key1: value 1
Key1: value 2
```
`key1` and `Key1` are actually identified as the same key and would be identified as duplicates, and thus would produce a parsing error.
<br/>

The name of the key is used to find/get its respective value.
<br/>
Given this XSON data:
```java
key: value
my key: my value
```
The values can be accessed using the key name:
```cs
get<string>("key"); //returns 'value' as a string variable (without the quotes)
get<string>("my key"); //returns 'my value' as a string variable (without the quotes)
```
<br/>

Spaces within the key names are allowed and preserved; Trailing and leading whitespace around the key and value are ignored. I.e., these are all equivalent:
```java
  my long key     : my long value
my long key:my long value
 my long key: my long value
    my long key    :my long value
my long key: my long value
```
`my long key` evaluates to `my long value` in all these examples. It is of course recommended however to use as little whitespace as you need to preserve readability, as with the first example in this section above. 

<br/>

It is also recommended to conform with the naming convention of the language when naming keys; For example:
```java
my key: my value //default
my_key: my value //C/C++
myKey: my value //Java/C# (remember that by default keys are case-insensitive, so the capital is just for readability)
```
<br/>

A **value** can be either an [Array](#Arrays), an [Object](#Objects), or (much like keys) a regular string. 

## Type Interpretation
There are no types (and thus no syntax typing) in XSON files. The data type of each string value is determined by the client using its parser. A parser can interpret values as essentially any type, as specified by the client; You are only limited by which parser you use (and thus the programming language of the parser you are using). Consider this example:
```java
my magic number: 10
```
This key/value pair can be interpreted as any type (that is valid within the programming language) by a parser, i.e. in C#:
```cs
get<string>("my magic number"); //returns '10' as a string variable
get<int>("my magic number"); //returns 10 as a signed integer
get<bool>("my magic number"); //returns 'true'
get<float>("my magic number"); //returns 10.f as a float
```
Of course, any value (including [arrays](#Arrays) and [objects](#Objects)) can be interpreted as a string regardless of the programming language used.

## Arrays
An array is a comma-separated collection of strings, enclosed by square brackets `[]`.
```java
my array: [
  value one,
  value two,
  value three
]
```
An optional trailing comma (i.e. a comma after the last value) is allowed. Functionally, this comma changes nothing when parsing, but is still allowed for git compatiblity and convenience.
```java
my array: [
  value one,
  value two,
  value three, //trailing comma is allowed
]
```
Any other rules for keys and values still apply to arrays and their values.

***Except***, unlike with key-value pairs, arrays (that are interpreted as such) are referenced using their index within the array:
```cs
get<string[]>("my array").get<string>(0) //returns 'value one'
get<string[]>("my array")[0]; //returns 'value one' as a string
get<string[]>("my array")[1]; //returns 'value two' as a string
get<string[]>("my array")[2]; //returns 'value three' as a string
get<string[]>("my array")[3]; //index out of bounds
```

## Objects
Objects in XSON are simply a collection of more key/value pairs, enclosed by curly braces `{}`:
```java
my key: my string value
my object: {
  property one: true
  property two: false
  property three: {
     key: this is inside yet another object
  }
  property four: [
    this is an array inside an object
  ]
}
```

## Comments
Comments in XSON share the same syntax as C-like programming languages (e.g. C++, C#, Java, etc.)

Single-line comments begin with two forward slashes `//`. Everything after the slashes is ignored by the parser, up until a new line
```java
//This is a single line comment
key: value //This is an in-line comment. This comment is not included in the value.
```

Multi-line comments begin with `/*` and end with `*/`. Everything in between is ignored.
```java
/********************************
 * This is a multi line comment *
 ********************************/

/* This is another multi line comment.
 Maybe it would describe the significance of 'key'
 */
key1: value /* You can place multi line comments on one line */
key2: value /* Or you could even make it span
               multiple lines after some XSON text */
```

## Directives
Directives/pragmas in XSON are used to denote special commands or behaviors to XSON (via the preprocessor). These commands include specifying [extensions](#Extensions) and [extension sets](#Extension-Sets). They are most similar in syntax to that of C (i.e. the C preprocessor).

Directives begin with a pound `#` symbol and are followed by the keyword of the directive, a space, and then the value(s):
```cpp
#<keyword> <value>
#<keyword> <value1>[,<value2>]... 
```
Any extra whitespace around directives is ignored, much like with strings. [Comments](#Comments) can be placed after directives.
In this example, these two directives are equivalent:
```cpp
#example 1,3
#example   1,   3  //This directive's extra space is ignored
```

## Extensions
An extension is a change or addition to the base specification of XSON. Each extension has a numerical ID (prefixed by XLE) that is used within XSON files.

In each XSON file (or associated schema file), each extension you wish to use must be specified (i.e. explicitly opted into) using the `ext` directive and the extension's ID number. You can use multiple directives or have multiple values in a comma-separated list. You can use hyphens to denote an inclusive range of extension IDs. Specify the extensions multiple times are allowed.
```cpp
#ext 10,12 //Use extensions XLE-10 and XLE-12
#ext 1,3-5,9 //Use extensions XLE-1, XLE-3, XLE-4, XLE-5, and XLE-9
#ext 19-22 //Use extensions XLE-19, XLE-20, XLE-21, and XLE-22
#ext 12-14 //Use extensions XLE-13 and XLE-14. XLE-12 is already enabled.
```

Each extension must have a listed purpose in its specification/documentation, which must be one of what's listed under [extension purposes]() in the wiki. 

Extensions can be made deprecated by newer ones if necessary. If you use a deprecated extension, a [XSON standard-complaint library]() will tell you that you are doing so. Thus, there are no mutually exclusive extensions; If two extensions have conflicting functionality, the older one must be superseded. This also means that you cannot directly update extensions; They must be replaced by a superseding extension.

Each extension is described in its specification document. For a [list of all extensions](), refer to the XSON wiki.

## Extension Sets
Extension Sets are pre-defined collections of extensions that are grouped together based on common functionality or purpose. This allows you to quickly specify a set of extensions that are needed for a certain overarching feature. 

Extension sets are specified using the `extset` directive and the set's name. Like with extension directives, you can use multiple extensions set directives or have multiple set names in a comma-separated list. 

For example, specifying the `json` extension set would automatically enable all extensions which are needed for JSON backwards compatibility:
```cpp
#extset json, yaml, ini //Enable all extensions needed for json, yaml, and ini backward compatibility
#extset shortcuts //Enable all extensions that are shortcut features
#extset qol //Enable all extensions that are quality-of-life features.
```

Unlike extensions, extension sets have multiple versions. An extension set version consists of just a major an minor version (e.g. `1.3` or `2.5`). New extensions can be added to an extension set or existing extensions in a set can be replaced with other extensions that have the same functionality. Note how you cannot remove existing functionality from an extension set; This is to preserve backwards-compatibility so that all newer versions of a set are compatible with all previous versions, including the very first version of the set (i.e. version 1.0). This also means if an XSON parser/library has/supports a newer version of an extension set than what you want to use/specify, you will not run into problems as the newer version it will use is guaranteed to be compatible with the older version you are using.

You are not *forced* to specify an extension set version. If you use an extension set without specifying a version, it will automatically default to using version `1.0` of that extension set:
```
//This will enable version 1.0 or above of the json, yaml, and ini extension sets.
#extset json, yaml, ini
```

Specifying an extension set version is done by just appending it to the set name in the directive, separated by a hyphen:
```
#extset shortcuts-2.3 //Enable the shortcut features extension set version 2.3 or above.
#extset qol-1.1 //Enable the quality of life extension set version 1.1 or above.
#extset json //Enable the json extension set version 1.0 or above.
```

Each extension set's specification document follows a template that shows which extensions are included in each version. For a [list of all extension sets](), refer to the XSON wiki.

## Files
- The standard file extension for XSON is `.xson`; You can also use `.sxon`.
- All new line characters are accepted; A newline in XSON can either be CR, LF, or CRLF (`\r` [`0x0D`], `\n` [`0x0A`], `\r\n` [`0x0D0A`] respectively).
- XSON files can be encoded in ANSI, UTF-8, UTF-16, or UTF-32 and still be accepted by [standard-compliant]() parsers. More encoding support is optional and would require extensions.
- [XSON schema files]() use the `.xs` extension.
- [XSON standard-compliant parsers]() are able to read XSON files and schema files regardless of file extension. This allows you to, for example, read JSON files directly without having to rename the files. (Note that in this case, the correct extensions for json compatibility must are enabled in a [schema]() to read json files directly with no modification).
- The *unofficial* [internet media type](https://en.wikipedia.org/wiki/Media_type) for XSON is `application/xson`.