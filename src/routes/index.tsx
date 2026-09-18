import { createFileRoute } from "@tanstack/react-router";
import { BrickRange } from "@/components/brick-range";
import { Contact } from "@/components/contact";
import { Hero, TrustGrid } from "@/components/hero";
import { Projects } from "@/components/projects";
import { StatsBand } from "@/components/stats-band";

export const Route = createFileRoute("/")({ component: Home });

function Home() {
  return (
    <>
      <a
        href="#bricks"
        className="sr-only focus:not-sr-only focus:absolute focus:top-2 focus:left-2 focus:z-50 focus:rounded-md focus:bg-paper focus:px-3 focus:py-2"
      >
        Skip to content
      </a>
      <main>
        <Hero />
        <TrustGrid />
        <BrickRange />
        <StatsBand />
        <Projects />
        <Contact />
      </main>
    </>
  );
}
