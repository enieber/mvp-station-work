import React from "react";
import createEmotionServer from "@emotion/server/create-instance";
import NextDocument, { Html, Main, Head, NextScript } from "next/document";
import { cache } from "@emotion/css";

class Document extends NextDocument {
  static async getInitialProps(ctx) {
    const page = await ctx.renderPage();
    const initialProps = await NextDocument.getInitialProps(ctx);
    const { css, ids } = renderStatic(page.html);

    return {
      ...initialProps,
      styles: (
        <>
          {initialProps.styles}
          <style
            data-emotion={`css ${ids.join(" ")}`}
            dangerouslySetInnerHTML={{ __html: css }}
          />
        </>
      ),
    };
  }

  render() {
    return (
      <Html lang="pt-BR">
        <Head>
          <link rel="preconnect" href="https://fonts.googleapis.com" />
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
          <link
            href="https://fonts.googleapis.com/css2?family=Chonburi&family=Corben:wght@400;700&display=swap"
            rel="stylesheet"
          />
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    );
  }
}

export const renderStatic = (html) => {
  if (html === undefined) {
    throw new Error("did you forget to return html from renderToString?");
  }
  const { extractCritical } = createEmotionServer(cache);
  const { ids, css } = extractCritical(html);

  return { html, ids, css };
};

export default Document;
