# gamesense.pub
Get Good, Get GameSense - Forum Source
# gamesense.pub - 2018 Forum & CSGO Project Source
* Get Good, Get GameSense - by h4xr0x * https://h4xr0x.cc
* live updated version at: https://gamesense.monster

  
# Original Project Overview:

* The Gamesense.pub 2018 project is an original initiative that includes a comprehensive forum integrated with external applications, leveraging a robust database API. This system is specifically tailored for CSGO (Counter-Strike: Global Offensive) modifications, showcasing an innovative approach to gaming experiences.

# Key Features:

* Forum Integration: The platform seamlessly integrates a feature-rich forum, fostering a vibrant community where users can engage in discussions, share insights, and stay updated on the latest developments.

* External Applications: Gamesense.pub extends its functionality by integrating external applications, enhancing the overall user experience and providing additional tools related to CSGO modifications.

* Database API: A sophisticated database API forms the backbone of the system, facilitating efficient data management, storage, and retrieval. This ensures seamless connectivity between various components of the project.

* CSGO Modifications: The primary focus lies in delivering a tailored experience for CSGO enthusiasts. The project actively explores and implements modifications to elevate gameplay, keeping the community at the forefront of innovation.

# Vision and Impact:

* Gamesense.pub stands as a testament to the commitment to excellence in the gaming community. By combining a powerful forum, external applications, and a dynamic database API, the project strives to redefine the CSGO gaming landscape. It serves as a hub for collaboration, knowledge-sharing, and the evolution of gaming modifications.

* This revised description aims to provide a clearer and more detailed overview of the Gamesense.pub 2018 project, highlighting its key features and the ## impact it seeks to make in the gaming community.

# GameSense / Project Source
* h4xr0x#1337 the orgional commit and leaked source:
* https://github.com/h4xrOx/gamesense.pub/commit/314ac72b70e8b03b4973e742790c2c0ffdcd004b

# The Exploit:
## Data Source Name (DSN) in Sentry
## Automatic Assignment

*  When you create a project in Sentry for event monitoring within your application, Sentry automatically assigns a unique Data Source Name (DSN) to your project.

# Purpose of the DSN

* The DSN serves as a crucial configuration parameter, informing the Sentry Software Development Kit (SDK) where to send events. In the absence of this 
* value, the SDK attempts to read it from the SENTRY_DSN environment variable. If that variable is also unavailable, the SDK refrains from sending any        * events. Note that in environments without a process environment, such as the browser, this fallback mechanism does not apply.

# Locating Your DSN

* To retrieve your DSN, navigate to Settings -> Projects -> Client Keys (DSN) in [sentry.io](http://sentry.io/).

# Components of the DSN

* The DSN comprises several components, including the protocol, public key, server address, and project identifier. The structure is as follows:

```{PROTOCOL}://{PUBLIC_KEY}:{SECRET_KEY}@{HOST}{PATH}/{PROJECT_ID}```

#DSN Settings for Production Build Packages

### The settings for generating production build packages and resources for the [skeet.cc](http://skeet.cc/) / (gamesense project)(https://gamesense.pub are as follows:

*  URI: "https://app.getsentry.com/24287"
*  Source Map: "[api-iam.intercom.io](http://api-iam.intercom.io/)"
*  Key: “f305de69cac64a84a494556d5303dc2d”
*  Project ID: “24287”
*  resulting “POST” request for a plain “JSON” payload would transmit to:
*  https://f305de69cac64a84a494556d5303dc2d@app.getsentry.com/24287

# Note::> “Secret Key”

* The secret part of the DSN is optional and effectively deprecated. While it is still honored by clients, future versions of Sentry will ignore it. Ensure compatibility with the current version.

# Security Implications

* The Sentry DSN was discovered in a minified and obfuscated JavaScript code on the website gamesense.pub, leaking the forum source. The code used * "https://app.intercom.com/" for building and securely integrating projects. The leaked DSN and version information were found in the mentioned JS file.

## h4xr0x#1337 intends to update:

* Due to community demand, there is an intention to update the entire project, making it freely available to everyone. This includes the website, integrations, loader client, dynamic libraries, source code, and Lua scripts used for modifications in CSGO.

### Additional Resources

* [ Link to the leaked JS file: https://raw.githubusercontent.com/h4xrOx/gamesense.pub/main/forums/wscum25h

* For more information on building integration with intercom, refer to Intercom’s developer documentation https://developers.intercom.com/docs/build-an-integration/
