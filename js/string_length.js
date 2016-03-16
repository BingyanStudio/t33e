/*
getLengthWithEmoji("😄😄") -> 2
"😄😄" -> 4
 */
function getLengthWithEmoji(text) {
    var emojiRegex = /([\uD800-\uDBFF][\uDC00-\uDFFF])/g;
    var emojis = text.match(emojiRegex); // find all emoji
    var noEmojiText = text.replace(emojiRegex, ""); // clear all emoji
    if (emojis) {
        return noEmojiText.length + emojis.length;
    }
    return text.length;
}
