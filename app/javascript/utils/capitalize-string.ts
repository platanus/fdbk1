function capitalizeString(input: string) {
  const trimmedInput = input.trim();
  if (trimmedInput.length === 0) {
    return '';
  }

  return trimmedInput.charAt(0).toUpperCase() + trimmedInput.slice(1).toLowerCase();
}

export default capitalizeString;
