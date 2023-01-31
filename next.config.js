/** @type {import("next").NextConfig} */
const config = {
  swcMinify: true,
  experimental: {
    appDir: true,
  },
  redirects: async () => [
    {
      source: "/cv",
      destination:
        "https://nane.notion.site/CV-4779ec94b3f24a909fb9c2afbfcba343",
      permanent: true,
    },
  ],
};

module.exports = config;
