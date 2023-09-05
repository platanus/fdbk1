function hashString(input: string): number {
  let hash = 0;
  for (let i = 0; i < input.length; i++) {
    const charCode = input.charCodeAt(i);
    hash += charCode;
  }

  return hash;
}

function tagClass(name: string) {
  const tagClasses = [
    'yellow-tag',
    'blue-tag',
    'red-tag',
    'purple-tag',
    'green-tag',
    'orange-tag',
  ];

  const baseClasses = 'ti-valid ti-tag';
  const colorClass = tagClasses[hashString(name) % tagClasses.length];

  return `${baseClasses} ${colorClass}`;
}

export default tagClass;
