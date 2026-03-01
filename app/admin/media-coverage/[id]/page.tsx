import { createClient } from "@/lib/supabase/server"
import { MediaCoverageForm } from "@/components/media-coverage-form"
import { notFound } from "next/navigation"

export default async function EditMediaCoveragePage({ params }: { params: { id: string } }) {
  const supabase = await createClient()
  const { data: mediaCoverage } = await supabase.from("media_coverage").select("*").eq("id", params.id).single()

  if (!mediaCoverage) {
    notFound()
  }

  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold text-primary">Edit Media Coverage</h1>
      <MediaCoverageForm mediaCoverage={mediaCoverage} />
    </div>
  )
}
