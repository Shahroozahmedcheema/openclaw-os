FROM node:22-slim

RUN npm install -g pnpm@9

WORKDIR /app

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY packages/claw-client ./packages/claw-client
COPY tsconfig.json ./

RUN pnpm install --frozen-lockfile

WORKDIR /app/packages/claw-client

RUN pnpm build

EXPOSE 7860

ENV PORT=7860
ENV HOSTNAME=0.0.0.0

CMD ["pnpm", "start", "--port", "7860"]
