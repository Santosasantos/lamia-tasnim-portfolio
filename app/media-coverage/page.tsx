import { createClient } from "@/lib/supabase/server"
import { Navbar } from "@/components/navbar"
import { Footer } from "@/components/footer"
import { PageHero } from "@/components/page-hero"
import Image from "next/image"
import Link from "next/link"
import { ExternalLink, Newspaper, Calendar } from "lucide-react"

export const dynamic = "force-dynamic"

export default async function MediaCoveragePage() {
  const supabase = await createClient()
  const { data: mediaCoverage } = await supabase
    .from("media_coverage")
    .select("*")
    .order("updated_at", { ascending: false })

  return (
    <div className="min-h-screen bg-white">
      <Navbar />
      <PageHero
        title="Media Coverage"
        subtitle="Featured in prominent national media and recognized internationally for advancing youth-led mental health reform, community health systems, and humanitarian engagement."
        backgroundType="blogs"
      />

      <main className="py-20 md:py-24">
        <div className="container mx-auto px-6 max-w-6xl">
          {mediaCoverage && mediaCoverage.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              {mediaCoverage.map((item: any) => (
                <article
                  key={item.id}
                  className="group flex flex-col rounded-2xl overflow-hidden border border-border hover:shadow-xl hover:-translate-y-1 transition-all duration-300 bg-white"
                >
                  {/* Image */}
                  <div className="relative w-full h-52 bg-gradient-to-br from-primary-light/30 to-primary-light/10 overflow-hidden flex-shrink-0">
                    {item.cover_image ? (
                      <Image
                        src={item.cover_image}
                        alt={item.article_title || item.outlet_name}
                        fill
                        className="object-cover group-hover:scale-105 transition-transform duration-500"
                        sizes="(max-width: 768px) 100vw, (max-width: 1024px) 50vw, 33vw"
                      />
                    ) : (
                      <div className="w-full h-full flex items-center justify-center">
                        <Newspaper className="h-16 w-16 text-primary/20" />
                      </div>
                    )}
                    {/* Outlet badge */}
                    <div className="absolute top-3 left-3 flex items-center gap-1.5 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-full text-xs font-bold text-primary shadow-sm">
                      <span>{item.outlet_icon}</span>
                      <span>{item.outlet_name}</span>
                    </div>
                  </div>

                  {/* Content */}
                  <div className="flex flex-col flex-1 p-5 gap-3">
                    {item.publication_date && (
                      <div className="flex items-center gap-1.5 text-xs text-muted-foreground">
                        <Calendar className="h-3.5 w-3.5" />
                        <span>{item.publication_date}</span>
                      </div>
                    )}

                    {/* Clickable title */}
                    {item.article_url ? (
                      <a
                        href={item.article_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="font-bold text-foreground text-base leading-snug hover:text-primary transition-colors group/link flex items-start gap-1"
                      >
                        <span>{item.article_title || item.outlet_name}</span>
                        <ExternalLink className="h-3.5 w-3.5 flex-shrink-0 mt-0.5 opacity-0 group-hover/link:opacity-100 transition-opacity" />
                      </a>
                    ) : (
                      <p className="font-bold text-foreground text-base leading-snug">
                        {item.article_title || item.outlet_name}
                      </p>
                    )}

                    {item.description && (
                      <p className="text-sm text-muted-foreground leading-relaxed line-clamp-3 flex-1">
                        {item.description}
                      </p>
                    )}

                    {item.article_url && (
                      <a
                        href={item.article_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="mt-auto inline-flex items-center gap-1.5 text-sm font-semibold text-primary hover:text-primary-dark transition-colors"
                      >
                        Read Full Article <ExternalLink className="h-3.5 w-3.5" />
                      </a>
                    )}
                  </div>
                </article>
              ))}
            </div>
          ) : (
            <div className="text-center py-24">
              <Newspaper className="h-16 w-16 text-gray-200 mx-auto mb-4" />
              <p className="text-muted-foreground text-lg">No media coverage available yet.</p>
            </div>
          )}
        </div>
      </main>

      <Footer />
    </div>
  )
}
