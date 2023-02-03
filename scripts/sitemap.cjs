const fs = require("fs");
const gm = require("gray-matter");

const articles = fs.readdirSync("./articles", { withFileTypes: true });
const result = articles
  .filter((dirent) => dirent.isFile())
  .map((dirent) => gm.read(`./articles/${dirent.name}`))
  .filter((content) => {
    return content.data.hidden !== true;
  });

const sitemap = (articles) => {
  const tags = new Set();

  articles.forEach((item) => {
    (item.data.tags || []).forEach((tag) => tags.add(tag));
  });

  const url = (loc, priority) => {
    return `
      <url>
        <loc>https://nabi.kim${loc}</loc>
        <lastmod>${new Date().toISOString()}</lastmod>
        <priority>${priority.toFixed(2)}</priority>
      </url>`;
  };

  return [
    `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">`,
    url("/", 1),
    url("/about.md", 0.8),
    url("/category", 0.8),
    url("/tag", 0.8),
    ...articles.map((item) =>
      url(`${item.path.slice("./articles/".length)}`, 0.8)
    ),
    ...Array.from(tags).map((tag) => url(`/tag/${encodeURI(tag)}`, 0.64)),
    url("/cv", 0.64),
    `</urlset>`,
  ].join("\n");
};

fs.writeFileSync("public/sitemap.xml", sitemap(result), "utf-8");
process.exit(0);
