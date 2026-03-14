import { createClient } from "@/lib/supabase/server"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import Link from "next/link"
import { Plus, ExternalLink } from "lucide-react"

export default async function MediaCoveragePage() {
  const supabase = await createClient()
  const { data: mediaCoverage } = await supabase
    .from("media_coverage")
    .select("*")
    .order("updated_at", { ascending: false })

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-primary">Media Coverage</h1>
        <Button asChild className="bg-primary hover:bg-primary-dark">
          <Link href="/admin/media-coverage/new">
            <Plus className="mr-2 h-4 w-4" />
            Add Media Coverage
          </Link>
        </Button>
      </div>

      <div className="grid gap-4">
        {mediaCoverage?.map((item: any) => (
          <Card key={item.id} className="hover:shadow-lg transition-shadow">
            <CardHeader>
              <CardTitle className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <span className="text-2xl">{item.outlet_icon}</span>
                  <span>{item.outlet_name}</span>
                  {item.is_featured && (
                    <span className="text-xs bg-primary text-white px-2 py-1 rounded-full">Featured</span>
                  )}
                </div>
                <Button asChild variant="outline" size="sm">
                  <Link href={`/admin/media-coverage/${item.id}`}>Edit</Link>
                </Button>
              </CardTitle>
            </CardHeader>
            <CardContent>
              {item.article_title && (
                <p className="font-semibold text-foreground mb-2">{item.article_title}</p>
              )}
              {item.description && <p className="text-muted-foreground mb-2">{item.description}</p>}
              <div className="flex items-center gap-4 text-sm text-muted-foreground">
                {item.publication_date && <span>{item.publication_date}</span>}
                {item.article_url && (
                  <a
                    href={item.article_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-primary hover:underline flex items-center gap-1"
                  >
                    View Article <ExternalLink className="h-3 w-3" />
                  </a>
                )}
              </div>
            </CardContent>
          </Card>
        ))}

        {!mediaCoverage || mediaCoverage.length === 0 && (
          <Card>
            <CardContent className="p-12 text-center">
              <p className="text-muted-foreground mb-4">No media coverage entries yet.</p>
              <Button asChild className="bg-primary hover:bg-primary-dark">
                <Link href="/admin/media-coverage/new">
                  <Plus className="mr-2 h-4 w-4" />
                  Add Your First Media Coverage
                </Link>
              </Button>
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  )
}
