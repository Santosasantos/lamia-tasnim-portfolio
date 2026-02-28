// Remove "use client" directive - this is now a Server Component
import { createClient } from "@/lib/supabase/server"
import { Navbar } from "@/components/navbar"
import { Footer } from "@/components/footer"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { ContactForm } from "@/components/contact-form"
import { ScrollButton } from "@/components/scroll-button"
import { DownloadCVButton } from "@/components/download-cv-button"
import {
  Download,
  Mail,
  School,
  Briefcase,
  Calendar,
  MapPin,
  BookOpen,
  Users,  
  ExternalLink,
  Award,
  Laptop,
  Languages,
  Heart,
  Building2,
  Phone,
  Linkedin,
  Facebook,
  ChevronDown,
  FileText,
  Quote,
} from "lucide-react"
import Image from "next/image"
import Link from "next/link"
import { ConferencePublicationSummary } from "@/components/conference-publication-summary"
import { LinkPreview } from "@/components/link-preview"

const categoryIcons = {
  Interpersonal: Users,
  Technical: Laptop,
  Languages: Languages,
}

// Flag images mapping - using flagcdn.com CDN for high-quality flag images
const languageFlags: Record<string, string> = {
  Bengali: "https://flagcdn.com/w320/bd.png",
  Bangla: "https://flagcdn.com/w320/bd.png",
  English: "https://flagcdn.com/w320/gb.png",
  Hindi: "https://flagcdn.com/w320/in.png",
  Urdu: "https://flagcdn.com/w320/pk.png",
  Arabic: "https://flagcdn.com/w320/sa.png",
  Spanish: "https://flagcdn.com/w320/es.png",
  French: "https://flagcdn.com/w320/fr.png",
  German: "https://flagcdn.com/w320/de.png",
  Chinese: "https://flagcdn.com/w320/cn.png",
  Japanese: "https://flagcdn.com/w320/jp.png",
}

// Force dynamic rendering to prevent caching in production
export const dynamic = 'force-dynamic'
export const revalidate = 0

export default async function Home() {
  const supabase = await createClient()

  const { data: profile } = await supabase.from("profiles").select("*").single()
  const { data: education } = await supabase.from("education").select("*").order("display_order", { ascending: true })
  const { data: experiences } = await supabase
    .from("experiences")
    .select("*")
    .order("display_order", { ascending: true })
  const { data: publications } = await supabase
    .from("publications")
    .select("*")
    .order("display_order", { ascending: true })
  const { data: awards } = await supabase.from("awards").select("*").order("display_order", { ascending: true })
  const { data: skills } = await supabase.from("skills").select("*").order("display_order", { ascending: true })
  const { data: volunteering } = await supabase
    .from("volunteering")
    .select("*")
    .order("display_order", { ascending: true })
  const { data: scholarlyActivities } = await supabase
    .from("scholarly_activities")
    .select("*")
    .order("display_order", { ascending: true })

  const researchExperiences = experiences?.filter((exp: any) => exp.category === "Research") || []
  const industryExperiences = experiences?.filter((exp: any) => exp.category === "Industry") || []

  const academicPublications = publications?.filter((pub: any) => pub.category === "Academic Publication") || []
  const nonAcademicPublications = publications?.filter((pub: any) => pub.category === "Non-Academic Publication") || []
  const conferencePublications = publications?.filter((pub: any) => pub.category === "Conference Publication") || []
  const workInProgress = publications?.filter((pub: any) => pub.category === "Work in Progress") || []

  const groupedSkills = skills?.reduce(
    (acc: any, skill: any) => {
      if (!acc[skill.category]) {
        acc[skill.category] = []
      }
      acc[skill.category].push(skill)
      return acc
    },
    {} as Record<string, typeof skills>,
  )

  const maxItemsToShow = 3

  return (
    <div className="min-h-screen bg-white">
      <Navbar />
      <main className="overflow-x-hidden">
        <section
          id="home"
          className="relative overflow-hidden bg-gradient-to-br from-primary-light/40 via-white to-primary-light/20 py-16 sm:py-20 md:py-24 lg:py-14 px-4 sm:px-6 lg:px-8"
        >
          {/* Subtle Bangladesh-inspired accent */}
          <div className="absolute inset-0 opacity-[0.03]" style={{ backgroundImage: "radial-gradient(circle at 20% 80%, #006a4e 1px, transparent 1px), radial-gradient(circle at 80% 20%, #006a4e 1px, transparent 1px)", backgroundSize: "48px 48px" }} aria-hidden />
          <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-primary/30 to-transparent" aria-hidden />
          <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-primary/20 to-transparent" aria-hidden />

          <div className="relative mx-auto max-w-7xl">
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-10 md:gap-14 lg:gap-16 items-center">
              <div className="order-2 lg:order-1 space-y-5 sm:space-y-6 text-center lg:text-left animate-slide-from-left">
                {/* Badge: Key Representative · Bangladesh */}
                <div className="inline-flex items-center gap-2 rounded-full border-2 border-primary/40 bg-white/80 px-4 py-2 text-sm font-semibold text-primary shadow-sm backdrop-blur-sm">
                  <span className="inline-block h-2 w-2 rounded-full bg-[#f42a41] animate-pulse" aria-hidden />
                  Key Representative · Bangladesh
                </div>
                <div>
                  <p className="text-xs sm:text-sm uppercase tracking-[0.2em] text-primary/70 mb-3 font-medium">
                    Representing Bangladesh in Global Mental Health & Public Health
                  </p>
                  <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-bold text-primary mb-4 sm:mb-5 leading-[1.1] tracking-tight">
                    {profile?.full_name || "Lamia Tasnim"}
                  </h1>
                  <p className="text-lg sm:text-xl md:text-2xl text-foreground/90 mb-5 sm:mb-6 font-medium leading-snug">
                    {profile?.title || "Public Health Professional | Researcher | Mental Health Systems Advocate"}
                  </p>
                  <p className="text-sm sm:text-base md:text-lg text-muted-foreground max-w-xl mx-auto lg:mx-0 leading-relaxed">
                    {profile?.bio ||
                      "Bangladeshi public health professional and mental health advocate with over a decade of experience. Her work connects research, AI in healthcare, and community programs—strengthening systems and representing Bangladesh in global mental health discussions, guided by ethics and sustainability."}
                  </p>
                </div>

                <div className="flex flex-col sm:flex-row gap-3 sm:gap-4 justify-center lg:justify-start pt-2">
                  <ScrollButton targetId="contact">
                    <Button
                      size="lg"
                      className="bg-primary hover:bg-primary-dark text-white w-full sm:w-auto px-8 py-3 sm:px-10 sm:py-3.5 text-base font-semibold shadow-lg shadow-primary/25 transition-all hover:shadow-xl hover:shadow-primary/30"
                    >
                      <Mail className="h-5 w-5 mr-2" />
                      Get in Touch
                    </Button>
                  </ScrollButton>
                  <DownloadCVButton />
                </div>
                <div className="pb-20 sm:pb-16 md:pb-12"></div>
              </div>

              <div className="order-1 lg:order-2 flex justify-center animate-slide-from-right">
                <div className="relative w-52 h-52 sm:w-60 sm:h-60 md:w-72 md:h-72 lg:w-[22rem] lg:h-[22rem] group">
                  <div className="absolute -inset-2 rounded-full bg-gradient-to-br from-primary/20 to-primary/5 blur-xl group-hover:from-primary/30 group-hover:to-primary/10 transition-all duration-500" aria-hidden />
                  <div className="absolute inset-0 rounded-full border-4 border-white shadow-[0_0_0_3px_rgba(3,100,69,0.3)] ring-4 ring-primary/10" aria-hidden />
                  <div className="relative w-full h-full rounded-full overflow-hidden border-4 border-primary shadow-2xl transition-all duration-500 hover:scale-[1.02] hover:shadow-primary/30">
                    <Image
                      src={profile?.profile_image || "/placeholder.svg?height=400&width=400"}
                      alt={profile?.full_name || "Profile"}
                      fill
                      className="object-cover transition-transform duration-500 group-hover:scale-105"
                      priority
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="absolute bottom-4 sm:bottom-6 md:bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
            <ScrollButton targetId="education">
              <button className="flex flex-col items-center gap-2 text-primary hover:text-primary-dark transition-colors">
                <span className="text-sm font-medium">Scroll Down For More</span>
                <ChevronDown className="h-6 w-6" />
              </button>
            </ScrollButton>
          </div>
        </section>

        {/* Education Section */}
        <section id="education" className="py-20 md:py-24 bg-white scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Education</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-2xl mx-auto">Academic journey and qualifications</p>
            </div>

            <div className="max-w-4xl mx-auto space-y-6">
              {education?.map((edu: any) => (
                <Card
                  key={edu.id}
                  className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                >
                  <CardContent className="p-8">
                    <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-4 mb-4">
                      <h3 className="text-2xl font-bold text-primary">{edu.degree}</h3>
                      <span className="text-sm font-semibold bg-primary text-white px-4 py-1.5 rounded-full whitespace-nowrap self-start">
                        {edu.status}
                      </span>
                    </div>
                    <div className="space-y-3">
                      <div className="flex items-center gap-3 text-foreground/80">
                        <School className="h-5 w-5 text-primary flex-shrink-0" />
                        <span className="font-semibold text-lg">
                          {edu.institution}, {edu.location}
                        </span>
                      </div>
                      <div className="flex items-center gap-4 text-base text-muted-foreground">
                        <span className="font-medium">
                          {edu.start_date} - {edu.end_date}
                        </span>
                        {edu.cgpa && <span className="font-bold text-primary text-lg">{edu.cgpa}</span>}
                      </div>
                      {edu.achievements && (
                        <div className="mt-6 pt-6 border-t border-border">
                          <p className="text-sm font-bold text-foreground mb-2">Core Courses:</p>
                          <p className="text-base text-muted-foreground leading-relaxed">{edu.achievements}</p>
                        </div>
                      )}
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        </section>

        {/* Experiences Section with Tabs */}
        <section id="experiences" className="py-20 md:py-24 bg-muted/30 scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Professional Experience</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                A focused overview of my work across public health research, mental health systems leadership, and
                community-scale programming—bridging evidence, ethics, and implementation.
              </p>
            </div>

            <Tabs defaultValue="research" className="max-w-5xl mx-auto">
              <TabsList className="grid w-full max-w-md mx-auto grid-cols-2 mb-12 h-auto p-1 bg-white shadow-sm">
                <TabsTrigger
                  value="research"
                  className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-base font-semibold"
                >
                  Research
                </TabsTrigger>
                <TabsTrigger
                  value="industry"
                  className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-base font-semibold"
                >
                  Industry
                </TabsTrigger>
              </TabsList>

              <TabsContent value="research" className="space-y-6">
                {researchExperiences.slice(0, maxItemsToShow).map((exp: any) => (
                  <Card
                    key={exp.id}
                    className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                  >
                    <CardContent className="p-8">
                      <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-4 mb-6">
                        <div className="flex-1">
                          <h3 className="text-2xl font-bold text-foreground mb-3">{exp.position}</h3>
                          <div className="flex items-center gap-3 text-primary font-semibold text-lg mb-2">
                            <Briefcase className="h-5 w-5" />
                            <span>{exp.organization}</span>
                          </div>
                          {exp.project_name && (
                            <p className="text-base text-muted-foreground">
                              <span className="font-semibold text-foreground">Project:</span> {exp.project_name}
                            </p>
                          )}
                        </div>
                        <span className="text-sm font-semibold bg-primary text-white px-4 py-1.5 rounded-full whitespace-nowrap self-start">
                          {exp.employment_type}
                        </span>
                      </div>

                      <div className="flex flex-wrap gap-6 text-base text-muted-foreground mb-6">
                        <div className="flex items-center gap-2">
                          <Calendar className="h-5 w-5" />
                          <span className="font-medium">
                            {exp.start_date} - {exp.end_date}
                          </span>
                        </div>
                        {exp.location && (
                          <div className="flex items-center gap-2">
                            <MapPin className="h-5 w-5" />
                            <span>{exp.location}</span>
                          </div>
                        )}
                      </div>

                      {exp.responsibilities && exp.responsibilities.length > 0 && (
                        <ul className="space-y-3">
                          {exp.responsibilities.map((responsibility: any, index: number) => (
                            <li key={index} className="flex gap-3 text-base">
                              <span className="text-primary font-bold text-lg">•</span>
                              <span className="text-muted-foreground leading-relaxed">{responsibility}</span>
                            </li>
                          ))}
                        </ul>
                      )}
                    </CardContent>
                  </Card>
                ))}
                {researchExperiences.length === 0 && (
                  <p className="text-center text-muted-foreground py-12 text-lg">No research experiences available.</p>
                )}
                
                {/* Evidence & Research Link */}
                <div className="flex justify-center pt-6">
                  <ScrollButton targetId="publications">
                    <Button
                      size="lg"
                      variant="outline"
                      className="border-2 border-primary text-primary hover:bg-primary hover:text-white font-semibold"
                    >
                      <Briefcase className="mr-2 h-5 w-5" />
                      View Research & Evidence
                      <ChevronDown className="ml-2 h-5 w-5" />
                    </Button>
                  </ScrollButton>
                </div>

                {researchExperiences.length > maxItemsToShow && (
                  <div className="flex justify-center pt-4">
                    <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                      <Link href="/experiences">
                        View All Experiences ({researchExperiences.length}) <ExternalLink className="ml-2 h-5 w-5" />
                      </Link>
                    </Button>
                  </div>
                )}
              </TabsContent>

              <TabsContent value="industry" className="space-y-6">
                {industryExperiences.slice(0, maxItemsToShow).map((exp: any) => (
                  <Card
                    key={exp.id}
                    className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                  >
                    <CardContent className="p-8">
                      <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-4 mb-6">
                        <div className="flex-1">
                          <h3 className="text-2xl font-bold text-foreground mb-3">{exp.position}</h3>
                          <div className="flex items-center gap-3 text-primary font-semibold text-lg mb-2">
                            <Briefcase className="h-5 w-5" />
                            <span>{exp.organization}</span>
                          </div>
                          {exp.project_name && (
                            <p className="text-base text-muted-foreground">
                              <span className="font-semibold text-foreground">Project:</span> {exp.project_name}
                            </p>
                          )}
                        </div>
                        <span className="text-sm font-semibold bg-primary text-white px-4 py-1.5 rounded-full whitespace-nowrap self-start">
                          {exp.employment_type}
                        </span>
                      </div>

                      <div className="flex flex-wrap gap-6 text-base text-muted-foreground mb-6">
                        <div className="flex items-center gap-2">
                          <Calendar className="h-5 w-5" />
                          <span className="font-medium">
                            {exp.start_date} - {exp.end_date}
                          </span>
                        </div>
                        {exp.location && (
                          <div className="flex items-center gap-2">
                            <MapPin className="h-5 w-5" />
                            <span>{exp.location}</span>
                          </div>
                        )}
                      </div>

                      {exp.responsibilities && exp.responsibilities.length > 0 && (
                        <ul className="space-y-3">
                          {exp.responsibilities.map((responsibility: any, index: number) => (
                            <li key={index} className="flex gap-3 text-base">
                              <span className="text-primary font-bold text-lg">•</span>
                              <span className="text-muted-foreground leading-relaxed">{responsibility}</span>
                            </li>
                          ))}
                        </ul>
                      )}
                    </CardContent>
                  </Card>
                ))}
                {industryExperiences.length === 0 && (
                  <p className="text-center text-muted-foreground py-12 text-lg">No industry experiences available.</p>
                )}
                {industryExperiences.length > maxItemsToShow && (
                  <div className="flex justify-center pt-8">
                    <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                      <Link href="/experiences">
                        View All Experiences ({industryExperiences.length}) <ExternalLink className="ml-2 h-5 w-5" />
                      </Link>
                    </Button>
                  </div>
                )}
              </TabsContent>
            </Tabs>
          </div>
        </section>

        {/* Scholarly Activities Section */}
        <section id="scholarly-activities" className="py-20 md:py-24 bg-white scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Scholarly Activities</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                Conference presentations, workshops, and academic engagements showcasing research dissemination and
                professional development.
              </p>
            </div>

            <div className="max-w-4xl mx-auto space-y-6">
              {scholarlyActivities?.slice(0, maxItemsToShow).map((activity: any) => (
                <Card
                  key={activity.id}
                  className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                >
                  <CardContent className="p-8">
                    <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-4 mb-3">
                      <h3 className="text-xl font-bold text-foreground flex-1 leading-snug">{activity.title}</h3>
                      <span className="text-xs font-semibold bg-primary text-white px-4 py-1.5 rounded-full whitespace-nowrap self-start">
                        {activity.type}
                      </span>
                    </div>
                    {activity.organization && (
                      <p className="text-base text-muted-foreground mb-3">
                        <span className="font-semibold text-foreground">Organization:</span> {activity.organization}
                      </p>
                    )}
                    <div className="flex items-center gap-2 text-base text-muted-foreground mb-4">
                      <Calendar className="h-5 w-5" />
                      <span className="font-medium">{activity.date}</span>
                    </div>
                    {activity.description && (
                      <p className="text-base text-muted-foreground leading-relaxed">{activity.description}</p>
                    )}
                  </CardContent>
                </Card>
              ))}
              {scholarlyActivities && scholarlyActivities.length > maxItemsToShow && (
                <div className="flex justify-center pt-8">
                  <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                    <Link href="/scholarly-activities">
                      View All Activities ({scholarlyActivities.length}) <ExternalLink className="ml-2 h-5 w-5" />
                    </Link>
                  </Button>
                </div>
              )}
            </div>
          </div>
        </section>

        {/* Publications Section with Tabs */}
        <section id="publications" className="py-20 md:py-24 bg-muted/30 scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Publications</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                A collection of my academic contributions, including peer-reviewed articles, conference presentations,
                and ongoing research projects.
              </p>
            </div>

            <Tabs defaultValue="academic" className="max-w-5xl mx-auto">
              <TabsList className="grid w-full max-w-3xl mx-auto grid-cols-4 mb-12 h-auto p-1 bg-white shadow-sm">
                <TabsTrigger
                  value="academic"
                  className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-xs md:text-sm font-semibold"
                >
                  Academic
                </TabsTrigger>
                <TabsTrigger
                  value="conference"
                  className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-xs md:text-sm font-semibold"
                >
                  Conference
                </TabsTrigger>
                <TabsTrigger
                  value="non-academic"
                  className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-xs md:text-sm font-semibold"
                >
                  Non-Academic
                </TabsTrigger>
                <TabsTrigger
                  value="work-in-progress"
                  className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-xs md:text-sm font-semibold"
                >
                  In Progress
                </TabsTrigger>
              </TabsList>

              <TabsContent value="academic" className="space-y-6">
                <div className="grid gap-6">
                  {academicPublications.slice(0, maxItemsToShow).map((pub: any) => (
                    <Card
                      key={pub.id}
                      className="border-l-4 border-primary hover:shadow-lg transition-all duration-300 hover:-translate-y-1"
                    >
                      <CardContent className="p-6">
                        <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-4 mb-4">
                          <h4 className="text-xl font-bold text-foreground flex-1 leading-snug">{pub.title}</h4>
                          {pub.status && (
                            <span
                              className={`text-xs font-semibold px-3 py-1 rounded-full whitespace-nowrap ${
                                pub.status === "Published" ? "bg-primary text-white" : "bg-yellow-100 text-yellow-800"
                              }`}
                            >
                              {pub.status}
                            </span>
                          )}
                        </div>

                        <div className="space-y-2 text-sm text-muted-foreground mb-4">
                          {pub.authors && (
                            <div className="flex items-center gap-2">
                              <Users className="h-4 w-4 flex-shrink-0 text-primary" />
                              <span>{pub.authors}</span>
                            </div>
                          )}
                          {pub.journal && (
                            <div className="flex items-center gap-2">
                              <BookOpen className="h-4 w-4 flex-shrink-0 text-primary" />
                              <span className="font-medium">{pub.journal}</span>
                            </div>
                          )}
                          <div className="flex items-center gap-4">
                            {pub.publication_date && (
                              <div className="flex items-center gap-2">
                                <Calendar className="h-4 w-4 flex-shrink-0 text-primary" />
                                <span>{pub.publication_date}</span>
                              </div>
                            )}
                            {pub.citation_count !== null && pub.citation_count !== undefined && (
                              <div className="flex items-center gap-2">
                                <Quote className="h-4 w-4 flex-shrink-0 text-primary" />
                                <span className="font-semibold">
                                  <span className="text-primary">{pub.citation_count}</span> citations
                                </span>
                              </div>
                            )}
                          </div>
                        </div>

                        {pub.abstract && (
                          <p className="text-sm text-muted-foreground mb-4 leading-relaxed line-clamp-2">{pub.abstract}</p>
                        )}

                        {pub.keywords && pub.keywords.length > 0 && (
                          <div className="mb-4 pt-4 border-t">
                            <div className="flex flex-wrap gap-2">
                              {pub.keywords.map((keyword: any, idx: number) => (
                                <span key={idx} className="text-xs bg-primary/10 text-primary px-2 py-1 rounded">
                                  {keyword}
                                </span>
                              ))}
                            </div>
                          </div>
                        )}

                        {pub.academic_pdf && (
                          <Button
                            asChild
                            variant="outline"
                            size="sm"
                            className="border-primary text-primary hover:bg-primary hover:text-white"
                          >
                            <a href={pub.academic_pdf} target="_blank" rel="noopener noreferrer">
                              <FileText className="mr-2 h-4 w-4" />
                              View PDF
                              <ExternalLink className="ml-2 h-4 w-4" />
                            </a>
                          </Button>
                        )}
                      </CardContent>
                    </Card>
                  ))}
                </div>
                {academicPublications.length === 0 && (
                  <p className="text-center text-muted-foreground py-12 text-lg">No academic publications available.</p>
                )}
                {academicPublications.length > maxItemsToShow && (
                  <div className="flex justify-center pt-8">
                    <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                      <Link href="/publications">
                        View All Publications ({academicPublications.length}) <ExternalLink className="ml-2 h-5 w-5" />
                      </Link>
                    </Button>
                  </div>
                )}
              </TabsContent>

              <TabsContent value="conference" className="space-y-6">
                <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {conferencePublications.slice(0, maxItemsToShow).map((pub: any) => (
                    <ConferencePublicationSummary key={pub.id} publication={pub} />
                  ))}
                </div>
                {conferencePublications.length === 0 && (
                  <p className="text-center text-muted-foreground py-12 text-lg">
                    No conference publications available.
                  </p>
                )}
                {conferencePublications.length > maxItemsToShow && (
                  <div className="flex justify-center pt-8">
                    <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                      <Link href="/publications">
                        View All Conference Publications ({conferencePublications.length}){" "}
                        <ExternalLink className="ml-2 h-5 w-5" />
                      </Link>
                    </Button>
                  </div>
                )}
              </TabsContent>

              <TabsContent value="non-academic" className="space-y-6">
                <div className="grid gap-6">
                  {nonAcademicPublications.slice(0, maxItemsToShow).map((pub: any) => (
                    <Card
                      key={pub.id}
                      className="border-l-4 border-primary hover:shadow-lg transition-all duration-300 hover:-translate-y-1"
                    >
                      <CardContent className="p-6">
                        <h4 className="text-xl font-bold text-foreground mb-4 leading-snug">{pub.title}</h4>
                        <div className="flex flex-wrap gap-4 text-sm text-muted-foreground mb-4">
                          {pub.journal && <span className="font-medium">{pub.journal}</span>}
                          {pub.publication_date && (
                            <span className="flex items-center gap-2">
                              <Calendar className="h-4 w-4" />
                              {pub.publication_date}
                            </span>
                          )}
                        </div>
                        {pub.url && (
                          <LinkPreview url={pub.url} title={pub.title} profileImage={profile?.profile_image} />
                        )}
                      </CardContent>
                    </Card>
                  ))}
                </div>
                {nonAcademicPublications.length === 0 && (
                  <p className="text-center text-muted-foreground py-12 text-lg">
                    No non-academic publications available.
                  </p>
                )}
                {nonAcademicPublications.length > maxItemsToShow && (
                  <div className="flex justify-center pt-8">
                    <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                      <Link href="/publications">
                        View All Publications ({nonAcademicPublications.length}){" "}
                        <ExternalLink className="ml-2 h-5 w-5" />
                      </Link>
                    </Button>
                  </div>
                )}
              </TabsContent>

              <TabsContent value="work-in-progress" className="space-y-6">
                {workInProgress.slice(0, maxItemsToShow).map((pub: any) => (
                  <Card
                    key={pub.id}
                    className="border-l-4 border-yellow-500 hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                  >
                    <CardContent className="p-8">
                      <div className="flex flex-col md:flex-row md:justify-between md:items-start gap-4 mb-4">
                        <h4 className="text-xl font-bold text-foreground flex-1 leading-snug">{pub.title}</h4>
                        {pub.status && (
                          <span
                            className={`text-xs font-semibold px-4 py-1.5 rounded-full whitespace-nowrap self-start ${
                              pub.status === "Under Review"
                                ? "bg-blue-100 text-blue-800"
                                : pub.status === "Revision Phase"
                                ? "bg-purple-100 text-purple-800"
                                : "bg-yellow-100 text-yellow-800"
                            }`}
                          >
                            {pub.status}
                          </span>
                        )}
                      </div>

                      {pub.authors && (
                        <div className="flex items-center gap-2 text-base text-muted-foreground mb-4">
                          <Users className="h-5 w-5 flex-shrink-0 text-primary" />
                          <span>{pub.authors}</span>
                        </div>
                      )}

                      {pub.abstract && (
                        <div className="mb-4">
                          <p className="text-base text-muted-foreground leading-relaxed whitespace-pre-line">
                            {pub.abstract}
                          </p>
                        </div>
                      )}

                      {pub.keywords && pub.keywords.length > 0 && (
                        <div className="pt-4 border-t border-border">
                          <p className="text-sm font-bold text-foreground mb-2">Keywords:</p>
                          <div className="flex flex-wrap gap-2">
                            {pub.keywords.map((keyword: any, idx: number) => (
                              <span key={idx} className="text-xs bg-yellow-100 text-yellow-800 px-3 py-1 rounded-full">
                                {keyword}
                              </span>
                            ))}
                          </div>
                        </div>
                      )}
                    </CardContent>
                  </Card>
                ))}
                {workInProgress.length === 0 && (
                  <p className="text-center text-muted-foreground py-12 text-lg">
                    No work in progress publications available.
                  </p>
                )}
                {workInProgress.length > maxItemsToShow && (
                  <div className="flex justify-center pt-8">
                    <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                      <Link href="/publications">
                        View All Publications ({workInProgress.length}) <ExternalLink className="ml-2 h-5 w-5" />
                      </Link>
                    </Button>
                  </div>
                )}
              </TabsContent>
            </Tabs>
          </div>
        </section>

        {/* Awards Section */}
        <section id="awards" className="py-20 md:py-24 bg-white scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Honors & Awards</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                Recognition and achievements demonstrating academic excellence and outstanding contributions.
              </p>
            </div>

            <div className="max-w-6xl mx-auto">
              <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                {awards?.slice(0, 6).map((award: any) => (
                  <Card
                    key={award.id}
                    className="border-t-4 border-primary hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 overflow-hidden"
                  >
                    <CardContent className="p-0">
                      {/* Award Image */}
                      <div className="relative w-full h-56 bg-gradient-to-br from-gray-50 to-gray-100">
                        {award.image ? (
                          <Image
                            src={award.image}
                            alt={award.title}
                            fill
                            className="object-contain p-4"
                          />
                        ) : (
                          <div className="flex items-center justify-center h-full">
                            <Award className="h-20 w-20 text-gray-300" />
                          </div>
                        )}
                      </div>

                      {/* Award Details */}
                      <div className="p-6">
                        <div className="flex flex-col items-center text-center">
                          <h3 className="text-lg font-bold text-foreground mb-2 leading-snug">{award.title}</h3>
                          <p className="text-base font-semibold text-primary mb-3">{award.issuer}</p>
                          {award.date && (
                            <p className="text-sm text-muted-foreground mb-3">{award.date}</p>
                          )}
                          {award.description && (
                            <p className="text-sm text-muted-foreground leading-relaxed">{award.description}</p>
                          )}
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))}
              </div>
              {awards && awards.length > 6 && (
                <div className="flex justify-center pt-12">
                  <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                    <Link href="/awards">
                      View All Awards ({awards.length}) <ExternalLink className="ml-2 h-5 w-5" />
                    </Link>
                  </Button>
                </div>
              )}
            </div>
          </div>
        </section>

        {/* Media Coverage Section - Press-room prestige, national & international recognition */}
        <section id="media-coverage" className="relative overflow-hidden py-24 md:py-28 scroll-mt-20">
          <div className="absolute inset-0 bg-gradient-to-b from-primary-light/25 via-white to-primary-light/15" aria-hidden />
          <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-primary/20 to-transparent" aria-hidden />
          <div className="relative container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-20">
              <p className="text-xs sm:text-sm uppercase tracking-[0.2em] text-primary/70 mb-4 font-semibold">
                National & International Recognition
              </p>
              <h2 className="text-4xl md:text-5xl lg:text-6xl font-bold text-primary mb-5 tracking-tight">
                Media Coverage & Public Recognition
              </h2>
              <div className="w-24 h-1 bg-primary mx-auto rounded-full mb-6" />
              <p className="text-lg sm:text-xl text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                Featured in prominent national media and recognized internationally for advancing youth-led mental health
                reform, community health systems, and ethically grounded humanitarian engagement—representing Bangladesh
                on the global stage.
              </p>
            </div>

            <div className="max-w-6xl mx-auto space-y-8">
              {/* International Award - Premium highlight */}
              <Card className="overflow-hidden border-2 border-primary/30 shadow-xl shadow-primary/5 bg-gradient-to-br from-white to-primary-light/10 hover:shadow-2xl hover:shadow-primary/10 transition-all duration-500">
                <div className="bg-primary/5 px-6 py-4 border-b border-primary/10">
                  <div className="flex items-center gap-3">
                    <div className="p-2.5 rounded-full bg-primary/15">
                      <Award className="h-6 w-6 text-primary" />
                    </div>
                    <div>
                      <p className="text-xs font-semibold uppercase tracking-wider text-primary/70">International Honor</p>
                      <h3 className="text-xl font-bold text-primary">Global Youth Leadership Award (Nepal)</h3>
                    </div>
                    <div className="ml-auto hidden sm:flex items-center gap-2 rounded-full bg-white/80 px-4 py-1.5 text-sm font-medium text-primary border border-primary/20">
                      <span className="h-1.5 w-1.5 rounded-full bg-[#f42a41]" aria-hidden /> Representing Bangladesh
                    </div>
                  </div>
                </div>
                <CardContent className="p-8">
                  <p className="text-base md:text-lg text-muted-foreground leading-relaxed">
                    In recognition of sustained contribution to mental health advocacy and youth leadership, Lamia
                    received the <strong className="text-foreground">Global Youth Leadership Award (Nepal)</strong>—an
                    international honor acknowledging her impact in advancing community-based mental health initiatives.
                    This recognition positions her among emerging global youth leaders in public health and mental
                    wellbeing, with cross-border acknowledgment of her work representing Bangladesh.
                  </p>
                </CardContent>
              </Card>

              <div className="grid lg:grid-cols-2 gap-8 items-start">
                {/* National media outlets - dignified strip */}
                <Card className="border-l-4 border-primary shadow-lg hover:shadow-xl transition-all duration-300">
                  <CardContent className="p-8">
                    <h3 className="text-xl font-bold text-primary mb-2">Featured in National Media</h3>
                    <p className="text-sm text-muted-foreground mb-6 leading-relaxed">
                      Lamia&apos;s work has been profiled by prominent Bangladeshi news outlets, documenting her
                      contributions to youth-led mental health reform, community health systems, and humanitarian engagement.
                    </p>
                    <div className="space-y-3">
                      {["The Bangladesh Today", "Daily Janakantha", "RisingBD", "Lalmonirhat Barta"].map((outlet) => (
                        <div
                          key={outlet}
                          className="flex items-center gap-4 rounded-xl border-2 border-primary/10 bg-white px-5 py-4 hover:border-primary/25 hover:bg-primary-light/20 transition-all duration-300"
                        >
                          <span className="h-2.5 w-2.5 rounded-full bg-primary flex-shrink-0" aria-hidden />
                          <span className="font-semibold text-foreground">{outlet}</span>
                        </div>
                      ))}
                    </div>
                  </CardContent>
                </Card>

                {/* Narrative context */}
                <Card className="border-l-4 border-primary/80 shadow-lg hover:shadow-xl transition-all duration-300">
                  <CardContent className="p-8 space-y-5">
                    <h3 className="text-xl font-bold text-primary">Public Recognition</h3>
                    <p className="text-base text-muted-foreground leading-relaxed">
                      Lamia Tasnim&apos;s work at the intersection of public health, mental health systems, and youth-led
                      community action has been profiled by national media in Bangladesh. These features document her
                      contributions to system-oriented mental health programming and community health initiatives that
                      prioritize ethical practice, sustainability, and measurable community-level benefit.
                    </p>
                    <p className="text-base text-muted-foreground leading-relaxed">
                      Coverage has emphasized her role in youth-led mental health reform, community health systems, and
                      humanitarian engagement with attention to dignity, consent, and cultural sensitivity—strengthening
                      her position as a key representative of Bangladesh in global mental health and public health
                      discussions.
                    </p>
                  </CardContent>
                </Card>
              </div>
            </div>
          </div>
        </section>

        {/* Skills Section with Tabs */}
        <section id="skills" className="py-20 md:py-24 bg-muted/30 scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Skills & Expertise</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                Technical proficiencies and interpersonal competencies developed through academic training and practical
                experience.
              </p>
            </div>

            <div className="max-w-6xl mx-auto space-y-8">
              <Tabs defaultValue="technical" className="w-full">
                <TabsList className="grid w-full max-w-2xl mx-auto grid-cols-3 mb-12 h-auto p-1 bg-white shadow-sm">
                  <TabsTrigger
                    value="technical"
                    className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-base font-semibold"
                  >
                    Technical
                  </TabsTrigger>
                  <TabsTrigger
                    value="interpersonal"
                    className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-base font-semibold"
                  >
                    Interpersonal
                  </TabsTrigger>
                  <TabsTrigger
                    value="languages"
                    className="data-[state=active]:bg-primary data-[state=active]:text-white py-3 text-base font-semibold"
                  >
                    Languages
                  </TabsTrigger>
                </TabsList>

                <TabsContent value="technical">
                  <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                    {groupedSkills?.Technical?.slice(0, 8).map((skill: any) => (
                      <Card
                        key={skill.id}
                        className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1 bg-white"
                      >
                        <CardContent className="p-6">
                          <div className="flex flex-col items-center text-center gap-3">
                            <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
                              <Laptop className="h-6 w-6 text-primary" />
                            </div>
                            <h4 className="font-bold text-foreground text-base">{skill.name}</h4>
                          </div>
                        </CardContent>
                      </Card>
                    ))}
                  </div>
                  {(!groupedSkills?.Technical || groupedSkills.Technical.length === 0) && (
                    <p className="text-center text-muted-foreground py-12 text-lg">No technical skills available.</p>
                  )}
                </TabsContent>

                <TabsContent value="interpersonal">
                  <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                    {groupedSkills?.Interpersonal?.slice(0, 8).map((skill: any) => (
                      <Card
                        key={skill.id}
                        className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1 bg-white"
                      >
                        <CardContent className="p-6">
                          <div className="flex flex-col items-center text-center gap-3">
                            <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
                              <Users className="h-6 w-6 text-primary" />
                            </div>
                            <h4 className="font-bold text-foreground text-base">{skill.name}</h4>
                          </div>
                        </CardContent>
                      </Card>
                    ))}
                  </div>
                  {(!groupedSkills?.Interpersonal || groupedSkills.Interpersonal.length === 0) && (
                    <p className="text-center text-muted-foreground py-12 text-lg">
                      No interpersonal skills available.
                    </p>
                  )}
                </TabsContent>

                <TabsContent value="languages">
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-4xl mx-auto">
                    {groupedSkills?.Languages?.map((skill: any) => {
                      const flagUrl = languageFlags[skill.name] || null
                      const proficiency = skill.proficiency || skill.description || "Basic"
                      const isHighProficiency =
                        proficiency.toLowerCase().includes("high") ||
                        proficiency.toLowerCase().includes("proficient") ||
                        proficiency.toLowerCase().includes("fluent") ||
                        proficiency.toLowerCase().includes("expert")
                      const isNative = proficiency.toLowerCase().includes("native")

                      return (
                        <Card
                          key={skill.id}
                          className={`hover:shadow-xl transition-all duration-300 hover:-translate-y-1 overflow-hidden border rounded-xl ${
                            isHighProficiency || isNative ? "bg-[#d4f1e8] border-[#036445]/20" : "bg-white border-gray-200"
                          }`}
                        >
                          <CardContent className="p-6">
                            <div className="flex flex-col items-center text-center gap-4">
                              {flagUrl ? (
                                <div className="relative w-32 h-24 flex items-center justify-center">
                                  <Image
                                    src={flagUrl}
                                    alt={`${skill.name} flag`}
                                    width={128}
                                    height={96}
                                    className="object-contain rounded shadow-sm"
                                    unoptimized
                                  />
                                </div>
                              ) : (
                                <div className="w-32 h-24 flex items-center justify-center text-6xl">
                                  🌐
                                </div>
                              )}
                              <div className="space-y-1">
                                <h4 className="font-bold text-primary text-xl tracking-tight">{skill.name}</h4>
                                <p
                                  className={`text-sm ${
                                    isHighProficiency || isNative
                                      ? "text-primary/80 font-medium"
                                      : "text-muted-foreground"
                                  }`}
                                >
                                  {isNative 
                                    ? "Native" 
                                    : isHighProficiency 
                                      ? `Proficiency Level ${proficiency.charAt(0).toUpperCase() + proficiency.slice(1).toLowerCase()}`
                                      : proficiency.charAt(0).toUpperCase() + proficiency.slice(1).toLowerCase()
                                  }
                                </p>
                              </div>
                            </div>
                          </CardContent>
                        </Card>
                      )
                    })}
                  </div>
                  {(!groupedSkills?.Languages || groupedSkills.Languages.length === 0) && (
                    <p className="text-center text-muted-foreground py-12 text-lg">No language skills available.</p>
                  )}
                </TabsContent>
              </Tabs>

              <div className="flex justify-center pt-8">
                <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                  <Link href="/skills">
                    View All Skills & Courses <ExternalLink className="ml-2 h-5 w-5" />
                  </Link>
                </Button>
              </div>
            </div>
          </div>
        </section>

        {/* Volunteering Section */}
        <section id="volunteering" className="py-20 md:py-24 bg-white scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Community Service</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                Community service and volunteer activities demonstrating commitment to social responsibility and
                community engagement.
              </p>
            </div>

            <div className="max-w-4xl mx-auto space-y-6">
              {volunteering?.slice(0, maxItemsToShow).map((activity: any) => (
                <Card
                  key={activity.id}
                  className="border-l-4 border-primary hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                >
                  <CardContent className="p-8">
                    <div className="flex items-start gap-6">
                      <div className="p-4 bg-primary/10 rounded-xl flex-shrink-0">
                        <Heart className="h-8 w-8 text-primary" />
                      </div>
                      <div className="flex-1">
                        <h3 className="text-2xl font-bold text-foreground mb-3">{activity.role}</h3>
                        <div className="flex items-center gap-3 text-primary font-semibold text-lg mb-3">
                          <Building2 className="h-5 w-5" />
                          <span>{activity.organization}</span>
                        </div>
                        <div className="flex items-center gap-3 text-base text-muted-foreground mb-4">
                          <Calendar className="h-5 w-5" />
                          <span className="font-medium">
                            {activity.start_date} - {activity.end_date}
                          </span>
                        </div>
                        {activity.description && (
                          <p className="text-base text-muted-foreground leading-relaxed">{activity.description}</p>
                        )}
                      </div>
                    </div>
                  </CardContent>
                </Card>
              ))}
              {volunteering && volunteering.length > maxItemsToShow && (
                <div className="flex justify-center pt-8">
                  <Button asChild size="lg" className="bg-primary hover:bg-primary-dark font-semibold">
                    <Link href="/volunteering">
                      View All Volunteering ({volunteering.length}) <ExternalLink className="ml-2 h-5 w-5" />
                    </Link>
                  </Button>
                </div>
              )}
            </div>
          </div>
        </section>

        {/* Contact Section */}
        <section id="contact" className="py-20 md:py-24 bg-muted/30 scroll-mt-20">
          <div className="container mx-auto px-6 max-w-7xl">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-primary mb-4">Get in Touch</h2>
              <div className="w-20 h-1.5 bg-primary mx-auto rounded-full mb-6"></div>
              <p className="text-lg text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                I welcome opportunities for collaboration, research partnerships, and professional engagement. Feel free
                to reach out for public health and mental health systems work, speaking engagements, or program design
                and evaluation support.
              </p>
            </div>

            <div className="max-w-6xl mx-auto grid lg:grid-cols-2 gap-12">
              {/* Contact Information */}
              <div className="space-y-6">
                <Card className="border-2 border-primary/20 shadow-lg">
                  <CardContent className="p-8">
                    <h3 className="text-2xl font-bold text-primary mb-8">Contact Information</h3>
                    <div className="space-y-6">
                      <div className="flex items-start gap-4">
                        <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
                          <Mail className="h-6 w-6 text-primary" />
                        </div>
                        <div>
                          <p className="font-semibold text-foreground mb-1">Email</p>
                          <a
                            href={`mailto:${profile?.email || "contact@lamia-tasnim.org"}`}
                            className="text-primary hover:underline"
                          >
                            {profile?.email || "contact@lamia-tasnim.org"}
                          </a>
                        </div>
                      </div>

                      <div className="flex items-start gap-4">
                        <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
                          <Phone className="h-6 w-6 text-primary" />
                        </div>
                        <div>
                          <p className="font-semibold text-foreground mb-1">Phone</p>
                          <p className="text-muted-foreground">{profile?.phone || "+880 1234-567890"}</p>
                        </div>
                      </div>

                      <div className="flex items-start gap-4">
                        <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
                          <MapPin className="h-6 w-6 text-primary" />
                        </div>
                        <div>
                          <p className="font-semibold text-foreground mb-1">Location</p>
                          <p className="text-muted-foreground">{profile?.address || "Dhaka, Bangladesh"}</p>
                        </div>
                      </div>
                    </div>

                    <div className="mt-8 pt-8 border-t border-border">
                      <h4 className="font-bold text-foreground mb-4">Connect with me</h4>
                      <div className="flex gap-4">
                        {profile?.linkedin_url && (
                          <Button
                            asChild
                            variant="outline"
                            size="icon"
                            className="border-2 border-primary hover:bg-primary hover:text-white bg-transparent"
                          >
                            <a href={profile.linkedin_url} target="_blank" rel="noopener noreferrer">
                              <Linkedin className="h-5 w-5" />
                            </a>
                          </Button>
                        )}
                        {profile?.facebook_url && (
                          <Button
                            asChild
                            variant="outline"
                            size="icon"
                            className="border-2 border-primary hover:bg-primary hover:text-white bg-transparent"
                          >
                            <a href={profile.facebook_url} target="_blank" rel="noopener noreferrer">
                              <Facebook className="h-5 w-5" />
                            </a>
                          </Button>
                        )}
                      </div>
                    </div>
                  </CardContent>
                </Card>
              </div>

              {/* Contact Form */}
              <div>
                <Card className="border-2 border-primary/20 shadow-lg">
                  <CardContent className="p-8">
                    <h3 className="text-2xl font-bold text-primary mb-6">Send a Message</h3>
                    <ContactForm />
                  </CardContent>
                </Card>
              </div>
            </div>
          </div>
        </section>
      </main>

      <Footer />
    </div>
  )
}
