import { createClient } from "@/lib/supabase/server"
import { Navbar } from "@/components/navbar"
import { Footer } from "@/components/footer"
import { PageHero } from "@/components/page-hero"
import { MapLocation } from "@/components/map-location"
import { ContactForm } from "@/components/contact-form"
import { Card, CardContent } from "@/components/ui/card"
import { MapPin, Mail, Phone, Linkedin, Facebook } from "lucide-react"

export default async function ContactPage() {
  const supabase = await createClient()

  const { data: profile } = await supabase.from("profiles").select("*").single()

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

      <PageHero
        title="CONTACT"
        subtitle="I welcome opportunities for collaboration, research partnerships, speaking engagements, and program design support across public health, mental health systems, and responsible digital health innovation."
        backgroundType="contact"
      />

      <main className="flex-1 py-12 bg-muted">
        <div className="max-w-6xl mx-auto px-6">
          <div className="grid lg:grid-cols-2 gap-6 mb-8">
            {/* Contact Information */}
            <div>
              <Card>
                <CardContent className="p-5">
                  <h2 className="text-xl font-bold text-primary mb-4">Contact Information</h2>
                  <div className="space-y-3">
                    <div className="flex items-start gap-3">
                      <MapPin className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                      <div>
                        <p className="font-medium">Address</p>
                        <p className="text-sm text-muted-foreground">
                          {profile?.address || "Dhaka, Bangladesh"}
                        </p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Mail className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                      <div>
                        <p className="font-medium">Email</p>
                        <p className="text-sm text-muted-foreground">{profile?.email || "20401026@std.cu.ac.bd"}</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Phone className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                      <div>
                        <p className="font-medium">Phone</p>
                        <p className="text-sm text-muted-foreground">{profile?.phone || "+880 1625144740"}</p>
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>

              <Card className="mt-4 bg-primary/5">
                <CardContent className="p-5">
                  <h3 className="font-bold text-primary mb-3">Collaboration & Engagement</h3>
                  <p className="text-sm text-muted-foreground leading-relaxed">
                    I am open to research and implementation partnerships that strengthen public health and mental
                    health systems—especially work that translates evidence into ethical, scalable, community-level
                    programs. Please reach out for collaboration, advisory support, training facilitation, or speaking
                    opportunities aligned with health equity, responsible digital health, and community mental health.
                  </p>
                </CardContent>
              </Card>

              <div className="mt-4 flex gap-4">
                <a
                  href={profile?.linkedin_url || "#"}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded hover:bg-primary-dark transition-colors"
                >
                  <Linkedin className="h-5 w-5" />
                  <span className="text-sm font-medium">LinkedIn</span>
                </a>
                <a
                  href={profile?.facebook_url || "#"}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded hover:bg-primary-dark transition-colors"
                >
                  <Facebook className="h-5 w-5" />
                  <span className="text-sm font-medium">Facebook</span>
                </a>
              </div>
            </div>

            {/* Contact Form */}
            <Card className="h-auto">
              <CardContent className="p-4">
                <h2 className="text-xl font-bold text-primary mb-3">Send a Message</h2>
                <ContactForm />
              </CardContent>
            </Card>
          </div>

          <div className="mt-8">
            <h2 className="text-2xl font-bold text-primary mb-4 text-center">Find Me Here</h2>
            <MapLocation
              latitude={23.8103}
              longitude={90.4125}
              locationName={profile?.address || "Dhaka, Bangladesh"}
            />
          </div>
        </div>
      </main>

      <Footer />
    </div>
  )
}
