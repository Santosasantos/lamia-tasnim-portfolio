"use client"

import { useRef, useCallback } from "react"
import { Textarea } from "@/components/ui/textarea"
import { Button } from "@/components/ui/button"
import { Bold } from "lucide-react"
import { cn } from "@/lib/utils"

interface RichTextareaProps extends React.TextareaHTMLAttributes<HTMLTextAreaElement> {
  value?: string
  onValueChange?: (val: string) => void
  defaultValue?: string
  rows?: number
  className?: string
}

export function RichTextarea({ value, onValueChange, defaultValue, rows = 5, className, ...props }: RichTextareaProps) {
  const ref = useRef<HTMLTextAreaElement>(null)

  const wrapBold = useCallback(() => {
    const el = ref.current
    if (!el) return
    const start = el.selectionStart
    const end = el.selectionEnd
    const text = el.value
    if (start === end) return // nothing selected

    const selected = text.slice(start, end)
    // Toggle: if already wrapped, unwrap; otherwise wrap
    const isWrapped = selected.startsWith("**") && selected.endsWith("**") && selected.length > 4
    const replacement = isWrapped ? selected.slice(2, -2) : `**${selected}**`
    const newText = text.slice(0, start) + replacement + text.slice(end)

    el.value = newText
    // Restore selection
    const newEnd = isWrapped ? end - 4 : end + 4
    el.setSelectionRange(start, newEnd)
    el.focus()

    // Trigger React synthetic change
    const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLTextAreaElement.prototype, "value")?.set
    nativeInputValueSetter?.call(el, newText)
    el.dispatchEvent(new Event("input", { bubbles: true }))

    onValueChange?.(newText)
  }, [onValueChange])

  const handleKeyDown = useCallback((e: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if ((e.ctrlKey || e.metaKey) && e.key === "b") {
      e.preventDefault()
      wrapBold()
    }
    props.onKeyDown?.(e)
  }, [wrapBold, props.onKeyDown])

  return (
    <div className="space-y-1">
      <div className="flex items-center gap-1 px-1">
        <Button
          type="button"
          variant="outline"
          size="sm"
          className="h-7 px-2 text-xs gap-1.5 font-bold"
          onClick={wrapBold}
          title="Bold selected text (Ctrl+B)"
        >
          <Bold className="h-3.5 w-3.5" />
          Bold
        </Button>
        <span className="text-xs text-muted-foreground ml-1">Select text then press Ctrl+B or click Bold</span>
      </div>
      <Textarea
        ref={ref}
        defaultValue={defaultValue}
        value={value}
        rows={rows}
        className={cn("font-mono text-sm", className)}
        onKeyDown={handleKeyDown}
        {...props}
      />
    </div>
  )
}
