<script lang="ts">
  // imports
  import { readContract, prepareWriteContract, writeContract } from "@wagmi/core";
  //import { fooABI, fooAddress } from "../generated";
  import { barABI, barAddress } from "../generated";
  import { foundry } from "@wagmi/core/chains";
  import { providers } from "../stores";

  // variables
  let inputMessage = "";
  let messageFromContract = "";

  console.log($providers[foundry.id].getBalance("0x000000"));

  // functions
  async function readMessage() {
    const data = await readContract({
      address: barAddress[foundry.id],
      abi: barABI,
      functionName: "myString",
    });
    messageFromContract = data;
  }

  async function writeMessage() {
    const config = await prepareWriteContract({
      address: barAddress[foundry.id],
      abi: barABI,
      functionName: "setMyString",
      args: [inputMessage],
    });
    await writeContract(config);
    readMessage();
  }
</script>

<section>Note: Must be connected to local foundry (anvil) network.</section>
<section>
  <input type="submit" value="Read message" on:click={readMessage} />
  <div style="text-align: center">Message from contract: {messageFromContract}</div>
</section>
<section>
  <form>
    <input type="text" placeholder="Enter some text..." bind:value={inputMessage} />
    <input type="submit" value="Write" on:click={writeMessage} />
  </form>
</section>
