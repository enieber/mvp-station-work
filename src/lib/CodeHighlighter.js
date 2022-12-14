const cheerio = require("cheerio");
const { decode } = require("html-entities");

export function highlight(content) {
  const Prism = require("prismjs");
  const loadLanguages = require("prismjs/components");
  const $ = cheerio.load(content);
  const codeBlocks = $("code[class^=language]");
  let html = "";

  if (codeBlocks.length > 0)
    codeBlocks.each(function () {
      const $code = $(this);
      const lang = $code.attr("class").replace("language-", "");
      const code = decode($code.html());

      if (!["javascript", "css", "clike", "markup"].includes(lang))
        loadLanguages([lang]);
      $code.html(Prism.highlight(code, Prism.languages[lang], code));
      $code.parent("pre").addClass(`language-${lang}`);
      html = $.html();
    });

  return html;
}
