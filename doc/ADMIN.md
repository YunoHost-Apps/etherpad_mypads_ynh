## Configuration

You can access two different admin panels, for Etherpad by accessing `domain.tld/admin` and for MyPads by `domain.tld/mypads/?/admin`. 
You can also find a configuration file for Etherpad at this path `/var/www/etherpad_mypads/settings.json`.

*Skin Builder* (accessible at this address `domain.tld/pad/p/test#skinvariantsbuilder`) allows you to customize the skin of your pad. It will give you a parameter to copy into your configuration file `/var/www/etherpad_mypads/settings.json`.

## YunoHost specific features

#### Multi-users support

 * Is LDAP auth supported (for MyPads access only)? **Yes**
 * Can the app be used by multiple users? **Yes**

## Additionnal informations

* This package will install the following plugins:

  * [ep_align](https://www.npmjs.com/package/ep_align) - *Add Left/Center/Right/Justify to lines of text in a pad*
  * [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Adds author names to span titles*
  * [ep_comments_page](https://www.npmjs.com/package/ep_comments_page) - *Adds comments on sidebar and link it to the text.*
  * [ep_countable](https://www.npmjs.com/package/ep_countable) - *Adds paragraphs, words and characters count*
  * [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Delete pads which were never edited*
  * [ep_font_color](https://www.npmjs.com/package/ep_font_color) - *Apply colors to fonts*
  * [ep_font_size](https://www.npmjs.com/package/ep_font_size) - *Add support for Font Sizes*
  * [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Adds heading support to Etherpad Lite.*
  * [ep_markdown](https://www.npmjs.com/package/ep_markdown) - *Edit and Export as Markdown in Etherpad*
  * [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groups and private pads for etherpad*
  * [ep_spellcheck](https://www.npmjs.com/package/ep_spellcheck) - *Add support to do 'Spell checking'*
  * [ep_subscript_and_superscript](https://www.npmjs.com/package/ep_subscript_and_superscript) - *Add support for Subscript and Superscript*
  * [ep_table_of_contents](https://www.npmjs.com/package/ep_table_of_contents) - *View a table of contents for your pad*
