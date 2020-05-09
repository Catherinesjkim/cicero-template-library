/** 
 * Ensures that the smart contract has been initialized
 * @param {*} ct HLF context
 * @returns {Promise<string>} the markdown string
 */
async function ensureInitialized(ctx) {
  const markdown = await ctx.stub.getState('Markdown');

  if(!markdown || markdown.toString().length === 0) {
    throw new Error('ERROR: contract has not been initialized');
  }

  return markdown.toString();
}

/**
 * Ensures that the smart contract has NOT been initialized
 * @param {*} ctx HLF context
 */