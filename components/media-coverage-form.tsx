"use client"

import type React from "react"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { createClient } from "@/lib/supabase/client"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Card, CardContent } from "@/components/ui/card"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { useToast } from "@/hooks/use-toast"
import { Switch } from "@/components/ui/switch"

interface MediaCoverageFormProps {
  mediaCoverage?: any
}

export function MediaCoverageForm({ mediaCoverage }: MediaCoverageFormProps) {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [isFeatured, setIsFeatured] = useState(mediaCoverage?.is_featured || false)
  const { toast } = useToast()

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setLoading(true)
    setError(null)

    const form = e.currentTarget

    const supabase = createClient()

    const formData = new FormData(form)
    const data = {
      outlet_name: formData.get("outlet_name") as string,
      outlet_icon: formData.get("outlet_icon") as string,
      article_title: formData.get("article_title") as string,
      article_url: formData.get("article_url") as string,
      publication_date: formData.get("publication_date") as string,
      description: formData.get("description") as string,
      is_featured: isFeatured,
    }

    try {
      if (mediaCoverage) {
        const { error: updateError } = await supabase
          .from("media_coverage")
          .update(data)
          .eq("id", mediaCoverage.id)
        if (updateError) throw updateError
        toast({
          title: "Success!",
          description: "Media coverage updated successfully.",
        })
      } else {
        const { error: insertError } = await supabase.from("media_coverage").insert(data)
        if (insertError) throw insertError
        toast({
          title: "Success!",
          description: "Media coverage created successfully.",
        })
      }

      router.push("/admin/media-coverage")
      router.refresh()
    } catch (err: any) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async () => {
    if (!mediaCoverage || !confirm("Are you sure you want to delete this media coverage?")) return

    setLoading(true)
    setError(null)

    const supabase = createClient()

    try {
      const { error: deleteError } = await supabase.from("media_coverage").delete().eq("id", mediaCoverage.id)
      if (deleteError) throw deleteError

      toast({
        title: "Success!",
        description: "Media coverage deleted successfully.",
      })

      router.push("/admin/media-coverage")
      router.refresh()
    } catch (err: any) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  return (
    <Card>
      <CardContent className="p-6">
        <form onSubmit={handleSubmit} className="space-y-6">
          {error && (
            <Alert variant="destructive">
              <AlertDescription>{error}</AlertDescription>
            </Alert>
          )}

          <div className="space-y-2">
            <Label htmlFor="outlet_name">Media Outlet Name *</Label>
            <Input
              id="outlet_name"
              name="outlet_name"
              defaultValue={mediaCoverage?.outlet_name}
              required
              placeholder="e.g., The Bangladesh Today"
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="outlet_icon">Icon/Emoji</Label>
            <Input
              id="outlet_icon"
              name="outlet_icon"
              defaultValue={mediaCoverage?.outlet_icon || "📰"}
              placeholder="📰"
              maxLength={10}
            />
            <p className="text-sm text-muted-foreground">
              Enter an emoji or icon to display next to the outlet name
            </p>
          </div>

          <div className="space-y-2">
            <Label htmlFor="article_title">Article Title (Optional)</Label>
            <Input
              id="article_title"
              name="article_title"
              defaultValue={mediaCoverage?.article_title}
              placeholder="Title of the article or feature"
            />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="article_url">Article URL (Optional)</Label>
              <Input
                id="article_url"
                name="article_url"
                type="url"
                defaultValue={mediaCoverage?.article_url}
                placeholder="https://..."
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="publication_date">Publication Date (Optional)</Label>
              <Input
                id="publication_date"
                name="publication_date"
                defaultValue={mediaCoverage?.publication_date}
                placeholder="e.g., March 2025"
              />
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="description">Description</Label>
            <Textarea
              id="description"
              name="description"
              defaultValue={mediaCoverage?.description}
              rows={4}
              placeholder="Brief description of the coverage"
            />
          </div>

          <div className="flex items-center space-x-2">
            <Switch id="is_featured" checked={isFeatured} onCheckedChange={setIsFeatured} />
            <Label htmlFor="is_featured" className="cursor-pointer">
              Featured (Display on homepage)
            </Label>
          </div>

          <div className="flex gap-3">
            <Button type="submit" className="bg-primary hover:bg-primary-dark" disabled={loading}>
              {loading ? "Saving..." : mediaCoverage ? "Update" : "Create"}
            </Button>

            {mediaCoverage && (
              <Button type="button" variant="destructive" onClick={handleDelete} disabled={loading}>
                Delete
              </Button>
            )}

            <Button type="button" variant="outline" onClick={() => router.back()} disabled={loading}>
              Cancel
            </Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}
