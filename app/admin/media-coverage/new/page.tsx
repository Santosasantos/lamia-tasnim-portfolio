import { MediaCoverageForm } from "@/components/media-coverage-form"

export default function NewMediaCoveragePage() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold text-primary">Add Media Coverage</h1>
      <MediaCoverageForm />
    </div>
  )
}
