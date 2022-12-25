const bsconfig = require("./bsconfig.json");

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  webpack(config, { isServer }) {
    config.module.rules.push({
      test: /\.svg$/,
      use: ["@svgr/webpack", "url-loader"],
    });
    if (!isServer) {
      config.resolve.fallback.fs = false;
    }
    return config;
  },
  async rewrites() {
        return [
          {
            source: '/api/:path*',
            destination: process.env.VERCEL_URL,
          },
        ]
      },

};

module.exports = nextConfig;
