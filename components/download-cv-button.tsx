"use client"

import { Download } from "lucide-react"
import { Button } from "@/components/ui/button"
import { useToast } from "@/hooks/use-toast"

export function DownloadCVButton() {
  const { toast } = useToast()

  const handleDownloadCV = async () => {
    const preferredUrl = "/Lamia_Tasnim_CV.pdf"

    try {
      const res = await fetch(preferredUrl, { method: "HEAD" })
      if (!res.ok) {
        toast({
          title: "CV not found",
          description: `Please add the CV file to public as ${preferredUrl}.`,
        })
        return
      }

      window.open(preferredUrl, "_blank")
    } catch {
      toast({
        title: "Unable to download CV",
        description: `Please add the CV file to public as ${preferredUrl}.`,
      })
    }
  }

  return (
    <Button
      size="lg"
      variant="outline"
      className="border-2 border-primary text-primary hover:bg-primary-light w-full sm:w-auto px-6 py-2.5 sm:px-8 sm:py-3 text-sm sm:text-base bg-transparent"
      onClick={handleDownloadCV}
    >
      <Download className="h-4 w-4 sm:h-5 sm:w-5 mr-2" />
      Download CV
    </Button>
  )
}