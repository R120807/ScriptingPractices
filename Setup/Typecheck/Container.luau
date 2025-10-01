--!strict

type Container<T> = T & {FindFirstChild: (T, string) -> Instance?}

