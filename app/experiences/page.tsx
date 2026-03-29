import { createClient } from "@/lib/supabase/server"
import { Navbar } from "@/components/navbar"
import { Footer } from "@/components/footer"
import { PageHero } from "@/components/page-hero"
import { Card, CardContent } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Briefcase, MapPin, Calendar } from "lucide-react"

export const dynamic = "force-dynamic"

export default async function ExperiencesPage() {
  const supabase = await createClient()

  const { data: experiences } = await supabase
    .from("experiences")
    .select("*")
    .order("display_order", { ascending: true })

  const researchExperiences = experiences?.filter((exp) => exp.category === "Research") || []
  const industryExperiences = experiences?.filter((exp) => exp.category === "Industry") || []

  const ExperienceCard = ({ exp }: { exp: any }) => (
    <Card className="border-l-4 border-primary hover:shadow-lg transition-shadow bg-white">
      <CardContent className="p-6">
        <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-3 mb-4">
          <div className="flex-1">
            <h3 className="text-xl font-bold text-foreground mb-1">{exp.position}</h3>
            <div className="flex items-center gap-2 text-primary font-medium mb-1">
              <Briefcase className="h-4 w-4 flex-shrink-0" />
              <span>{exp.organization}</span>
            </div>
            {exp.project_name && (
              <p className="text-sm text-muted-foreground">
                <span className="font-semibold text-foreground">Project:</span> {exp.project_name}
              </p>
            )}
          </div>
          <span className="text-xs font-semibold bg-primary text-white px-3 py-1.5 rounded-full whitespace-nowrap self-start">
            {exp.employment_type}
          </span>
        </div>

        <div className="flex flex-wrap gap-4 text-sm text-muted-foreground mb-4">
          <div className="flex items-center gap-1.5">
            <Calendar className="h-4 w-4" />
            <span>{exp.start_date} - {exp.end_date}</span>
          </div>
          {exp.location && (
            <div className="flex items-center gap-1.5">
              <MapPin className="h-4 w-4" />
              <span>{exp.location}</span>
            </div>
          )}
        </div>

        {exp.description && (
          <p className="text-sm text-muted-foreground mb-4 leading-relaxed">{exp.description}</p>
        )}

        {exp.responsibilities && exp.responsibilities.length > 0 && (
          <ul className="space-y-2">
            {exp.responsibilities.map((responsibility: string, index: number) => (
              <li key={index} className="flex gap-2.5 text-sm">
                <span className="mt-1.5 w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0 inline-block"></span>
                <span className="text-muted-foreground leading-relaxed">
                  {responsibility.split(/\*\*(.+?)\*\*/g).map((part, i) =>
                    i % 2 === 1
                      ? <strong key={i} className="font-semibold text-foreground">{part}</strong>
                      : part
                  )}
                </span>
              </li>
            ))}
          </ul>
        )}
      </CardContent>
    </Card>
  )

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

      <PageHero
        title="Professional Experience"
        subtitle="A comprehensive overview of my research, academic, and industry experiences that have shaped my professional development."
        backgroundType="experience"
      />

      <main className="flex-1 py-20 bg-[#f8fafc]">
        <div className="container mx-auto px-6 max-w-6xl">
          <Tabs defaultValue={researchExperiences.length > 0 ? "research" : "industry"}>
            <TabsList className="grid w-full max-w-sm mx-auto grid-cols-2 mb-10 h-auto p-1 bg-white border border-border rounded-xl shadow-sm">
              <TabsTrigger
                value="research"
                className="data-[state=active]:bg-primary data-[state=active]:text-white py-2.5 text-sm font-semibold rounded-lg"
              >
                Research ({researchExperiences.length})
              </TabsTrigger>
              <TabsTrigger
                value="industry"
                className="data-[state=active]:bg-primary data-[state=active]:text-white py-2.5 text-sm font-semibold rounded-lg"
              >
                Industry ({industryExperiences.length})
              </TabsTrigger>
            </TabsList>

            <TabsContent value="research" className="space-y-5">
              {researchExperiences.length > 0 ? (
                researchExperiences.map((exp) => <ExperienceCard key={exp.id} exp={exp} />)
              ) : (
                <p className="text-center text-muted-foreground py-16">No research experiences available.</p>
              )}
            </TabsContent>

            <TabsContent value="industry" className="space-y-5">
              {industryExperiences.length > 0 ? (
                industryExperiences.map((exp) => <ExperienceCard key={exp.id} exp={exp} />)
              ) : (
                <p className="text-center text-muted-foreground py-16">No industry experiences available.</p>
              )}
            </TabsContent>
          </Tabs>
        </div>
      </main>

      <Footer />
    </div>
  )
}
