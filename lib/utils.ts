import { clsx, type ClassValue } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

/**
 * Parse a string with **bold** markers into React-renderable segments.
 * Returns an array of { text, bold } objects.
 */
export function parseBoldText(input: string): { text: string; bold: boolean }[] {
  const parts: { text: string; bold: boolean }[] = []
  const regex = /\*\*(.+?)\*\*/g
  let lastIndex = 0
  let match: RegExpExecArray | null

  while ((match = regex.exec(input)) !== null) {
    if (match.index > lastIndex) {
      parts.push({ text: input.slice(lastIndex, match.index), bold: false })
    }
    parts.push({ text: match[1], bold: true })
    lastIndex = regex.lastIndex
  }

  if (lastIndex < input.length) {
    parts.push({ text: input.slice(lastIndex), bold: false })
  }

  return parts
}
