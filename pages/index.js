import HomePage from "pages/Home.mjs";
export { getStaticProps } from "pages/Home.mjs";

export default function Home(props) {
  return <HomePage {...props} />;
}
