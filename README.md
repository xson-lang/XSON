# XSON
***eXtensible and Simple Object Notation*** is an [open](https://en.wikipedia.org/wiki/Open_standard) [data interchange language](https://en.wikipedia.org/wiki/Electronic_data_interchange)/[file format](https://en.wikipedia.org/wiki/File_format) created by Artin Alavi ([Arastais](https://github.com/Arastais)). It is designed to be the quintessential format for many electronic applications, including data serialization and configuration files, and to solve many of the problems with commonly-used data interchange formats. 

XSON is built with two core principles:
- *An exceedingly **simple** base specification* that allows standalone XSON to be extremely minimal, containing only features and syntax that is absolutely necessary - no extra features that may go unused. Standalone XSON is also exceptionally human-readable due to its simple and lightweight nature; This should enable users who do not have any prior knowledge of XSON to understand and infer the rules of XSON and thus even modify XSON files. There is no versioning for the base spec - just one standarized specification and no dialects - so no need to keep up with changes to the spec.
- *An **extension system*** that allows users to explicitly specify additional/optional features or feature sets on a per-file basis. Each extension is a new feature or change to the base spec of XSON. Each extension or extension set must be explicitly enabled, thus it is clear which extensions are being used in an XSON file; This allows users to only use the features they want and outside readers to know which features are being leveraged. This system is most similar semantically to the XEP series of [XMPP](https://xmpp.org/extensions/): Each extension is identified with a unique ID coupled with the `XLE` prefix (e.g. `XLE-1`). Opting-in to the necessary extensions also allows XSON to be backwards-compatible with other common file formats such as [JSON](https://www.json.org), [YAML](https://yaml.org/), and [INI](https://en.wikipedia.org/wiki/INI_file).

See the [wiki]() for more details, including the base spec and extensions.

## Example
Here is a simple example of an xson file (with no extensions enabled):
```java
/* (This is a multi-line comment)
 * List of servers in an XSON file
 */
servers: {
  //Another comment.
  alpha:  [10.0.0.2, My Home Server]
  bravo:  [10.0.0.7, My Work Server]
  charlie:[10.0.0.9, My Friend's Server]
  aux: {
    //Whitespace around (but not inside) the key or value is ignored
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10 //The first colon is used to seperate the key and value
  }
}
```

## Repo Folder Structure
- `/docs`: All documentation for XSON, including the wiki, readme, base spec, and all implementation details
- `/samples`: Sample XSON files
- `/grammar`: TextMate grammar files for XSON

## Contributing
Thanks for consdering contributing to XSON! All contributions are appreciated!

>*If you would like to contribute to the base spec before it is fully released, feel free to open an [issue](issues) or [discussion](discussions) after refering to the [Contribution Guidelines]()*

If you think you could **improve any of the documentation** in some way, open a [pull request]() using the proper template.

If you would like to **create a parser and/or generator for XSON** (i.e. a library), or get your parser/generator listed under the [XSON Libraries]() list, refer to the [XSON Library Guidelines]()

To **request a feature/extension**, raise an [issue](issues) for it, following the correct issue guidelines/template.

If you want to actually **create an extension** for XSON, refer to the [Extension Guidelines]() and open a [Pull Request]() using the correct guildelines/template.

If you would like to **donate** to the XSON project, you can [donate through GitHub]()